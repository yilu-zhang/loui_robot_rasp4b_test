#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <pthread.h>
#include "controlcan.h"

#include <ctime>
#include <cstdlib>
#include "unistd.h"

#include "ros/ros.h"
//#include "std_msgs.h"
#include "geometry_msgs/Twist.h"
#include "control_can_motor/Motor.h"

#include  <wiringPiI2C.h>
#include  <math.h>

int fd;
int acclX, acclY, acclZ;
int gyroX, gyroY, gyroZ;
//double acclX_scaled, acclY_scaled, acclZ_scaled;
//double gyroX_scaled, gyroY_scaled, gyroZ_scaled;

int read_word_2c(int addr)
{
  int val;
  val = wiringPiI2CReadReg8(fd, addr);
  val = val << 8;
  val += wiringPiI2CReadReg8(fd, addr+1);
  if (val >= 0x8000)
    val = -(65536 - val);

  return val;
}

void motor_action(const geometry_msgs::Twist::ConstPtr& msg);

int main(int argc, char **argv)
{
	ros::init(argc, argv, "control");
	printf(">>this is first control node!\r\n");//指示程序已运行

	ros::NodeHandle n;

	ros::Subscriber sub= n.subscribe("/turtle1/cmd_vel", 100,motor_action);
	ros::Publisher motor_pub = n.advertise<control_can_motor::Motor>("motor_info", 10);
	
	fd = wiringPiI2CSetup (0x68);
	wiringPiI2CWriteReg8 (fd,0x6B,0x00);//disable sleep mode 
	printf("set 0x6B=%X\n",wiringPiI2CReadReg8 (fd,0x6B));

	if(VCI_OpenDevice(VCI_USBCAN2,0,0)==1)//打开设备
	{
		printf(">>open deivce success!\n");//打开设备成功
	}else
	{
		printf(">>open deivce error!\n");
		exit(1);
	}

	//初始化参数，严格参数二次开发函数库说明书。
	VCI_INIT_CONFIG config;
	config.AccCode=0x80000000;
	config.AccMask=0xFFFFFFFF;
	config.Filter=0;//接收所有帧
	config.Timing0=0x00;/*波特率1000 Kbps  0x00  0x14*/
	config.Timing1=0x14;
	config.Mode=0;//正常模式		
	
	if(VCI_InitCAN(VCI_USBCAN2,0,0,&config)!=1)
	{
		printf(">>Init CAN1 error\n");
		VCI_CloseDevice(VCI_USBCAN2,0);
	}

	if(VCI_StartCAN(VCI_USBCAN2,0,0)!=1)
	{
		printf(">>Start CAN1 error\n");
		VCI_CloseDevice(VCI_USBCAN2,0);
	}

	//需要发送的帧，结构体设置

	usleep(100000);
	VCI_CAN_OBJ send[2];
	send[0].ID=0x00;
	send[0].SendType=1;
	send[0].DataLen=8;
	send[0].ExternFlag=0;
	send[0].RemoteFlag=0;
	send[1].ID=0x20;
	send[1].SendType=1;
	send[1].DataLen=8;
	send[1].ExternFlag=0;
	send[1].RemoteFlag=0;

	int i=0;
	for(i = 0; i < send[0].DataLen; i++)
	{
		send[0].Data[i] = 0x55;
		send[1].Data[i] = 0x55;
	}


	if(VCI_Transmit(VCI_USBCAN2, 0, 0, send, 1) == 1)
	{
		printf("reset succes!\n");
	}
	else
	{
		printf("reset fail!\n");
	        usleep(100000);//延时100ms。
		VCI_CloseDevice(VCI_USBCAN2,0);//关闭设备。
		exit(1);
	}

	usleep(500000);
	send[0].ID=0x01;
	send[1].ID=0x21;

	send[0].Data[0] = 0x06;
	send[1].Data[0] = 0x06;
	for(i = 1; i < send[0].DataLen; i++)
	{
		send[0].Data[i] = 0x55;
		send[1].Data[i] = 0x55;
	}


	if(VCI_Transmit(VCI_USBCAN2, 0, 0, send, 1) == 1)
	{
		printf("set mode succes!\n");
	}
	else
	{
		printf("set mode fail!\n");
	        usleep(100000);//延时100ms。
		VCI_CloseDevice(VCI_USBCAN2,0);//关闭设备。
		exit(1);
	}
	usleep(500000);
	
	send[0].ID=0x1A;
        send[1].ID=0x2A;

        send[0].Data[0] = 0x0A;
        send[1].Data[0] = 0x0A;
        send[0].Data[1] = 0x00;
        send[1].Data[1] = 0x00;

	//int i;
        for(i = 4; i < send[0].DataLen; i++)
        {
                send[0].Data[i] = 0x55;
                send[1].Data[i] = 0x55;
        }
	
	if(VCI_Transmit(VCI_USBCAN2, 0, 0, send, 1) == 1)
	{
		printf("set feedback succes!\n");
	}
	else
	{
		printf("set feedback fail!\n");
	        usleep(100000);//延时100ms。
		VCI_CloseDevice(VCI_USBCAN2,0);//关闭设备。
		exit(1);
	}
	usleep(5000);
	
	if(VCI_Transmit(VCI_USBCAN2, 0, 0, &send[1], 1) == 1)
	{
		printf("set feedback succes!\n");
	}
	else
	{
		printf("set feedback fail!\n");
	        usleep(100000);//延时100ms。
		VCI_CloseDevice(VCI_USBCAN2,0);//关闭设备。
		exit(1);
	}
	
	usleep(5000);

	printf("waiting!\n");
	ros::Rate loop_rate(10);
	int reclen=0;
        int ind=0;
	VCI_CAN_OBJ rec[3000];//接收缓存，设为3000为佳。
	while(ros::ok())
	{
		ros::spinOnce();
		if((reclen=VCI_Receive(VCI_USBCAN2,0,ind,rec,3000,100))>0)//调用接收函数，如果有数据，进行数据处理显示。
         	{
			//printf("publish success!");
                	i=reclen-1;
			control_can_motor::Motor motor_real;
			motor_real.motor_id=rec[i].ID;//&0xFFF0;
			motor_real.current=(rec[i].Data[0]<<8)|rec[i].Data[1];
			motor_real.velocity=(rec[i].Data[2]<<8)|rec[i].Data[3];
			motor_real.position=(rec[i].Data[4]<<24)|(rec[i].Data[3]<<16)|(rec[i].Data[2]<<8)|rec[i].Data[1];
			
			acclX = read_word_2c(0x3B);
			acclY = read_word_2c(0x3D);
			acclZ = read_word_2c(0x3F);
			motor_real.acclX_scaled = acclX *100000/ 16384.0;
			motor_real.acclY_scaled = acclY *100000/ 16384.0;
			motor_real.acclZ_scaled = acclZ *100000/ 16384.0;
			
			gyroX = read_word_2c(0x43);
			gyroY = read_word_2c(0x45);
			gyroZ = read_word_2c(0x47);
			motor_real.gyroX_scaled = gyroX *100000/ 131.0;
			motor_real.gyroY_scaled = gyroY *100000/ 131.0;
			motor_real.gyroZ_scaled = gyroZ *100000/ 131.0;
			
			motor_pub.publish(motor_real);
                  }

	        else
       		 {
               		 printf("receive2 fail!\n");
       		 }
		 loop_rate.sleep();
	}	

        return 0;
}

void motor_action(const geometry_msgs::Twist::ConstPtr& msg)
{	
	printf("action!\n");
        VCI_CAN_OBJ send[2];
        send[0].ID=0x17;
        send[0].SendType=1;
        send[0].DataLen=8;
        send[0].ExternFlag=0;
        send[0].RemoteFlag=0;
        send[1].ID=0x27;
        send[1].SendType=1;
        send[1].DataLen=8;
        send[1].ExternFlag=0;
	
	int i;
	for(i = 4; i < send[0].DataLen; i++)
        {
                send[0].Data[i] = 0x55;
                send[1].Data[i] = 0x55;
        }

	if(msg->linear.x==2)
	{
	send[0].ID=0x07;
	send[0].Data[0] = 0x0F;
        send[1].Data[0] = 0x0F;
        send[0].Data[1] = 0xA0;
        send[1].Data[1] = 0xA0;
        send[0].Data[2] = 0x01;
        send[1].Data[2] = 0x01;
        send[0].Data[3] = 0xA4;
        send[1].Data[3] = 0xA4;

	VCI_Transmit(VCI_USBCAN2, 0, 0, send, 1);
	}
	
	else if(msg->linear.x==-3)
	{
	send[0].ID=0x07;
	send[0].Data[0] = 0x0F;
        send[1].Data[0] = 0x0F;
        send[0].Data[1] = 0xA0;
        send[1].Data[1] = 0xA0;
        send[0].Data[2] = 0xFE;
        send[1].Data[2] = 0xFE;
        send[0].Data[3] = 0x5C;
        send[1].Data[3] = 0x5C;

	VCI_Transmit(VCI_USBCAN2, 0, 0, send, 1);
	}
	
	else if(msg->linear.x==-2)
        {
	send[0].ID=0x07;
        send[0].Data[0] = 0x0F;
        send[1].Data[0] = 0x0F;
        send[0].Data[1] = 0xA0;
        send[1].Data[1] = 0xA0;
        send[0].Data[2] = 0x00;
        send[1].Data[2] = 0x00;
        send[0].Data[3] = 0x00;
        send[1].Data[3] = 0x00;

        VCI_Transmit(VCI_USBCAN2, 0, 0, send, 1);
        }

	else if(msg->angular.z==2)
        {
	send[0].ID=0x17;
        send[0].Data[0] = 0x0F;
        send[1].Data[0] = 0x0F;
        send[0].Data[1] = 0xA0;
        send[1].Data[1] = 0xA0;
        send[0].Data[2] = 0x00;
        send[1].Data[2] = 0xFF;
        send[0].Data[3] = 0xD2;
        send[1].Data[3] = 0x2E;

	//usleep(5000);
        VCI_Transmit(VCI_USBCAN2, 0, 0, send, 1);
	usleep(10000);
	VCI_Transmit(VCI_USBCAN2, 0, 0, &send[1], 1);
        }
	else if(msg->angular.z==-2)
        {
	send[0].ID=0x17;
        send[0].Data[0] = 0x0F;
        send[1].Data[0] = 0x0F;
        send[0].Data[1] = 0xA0;
        send[1].Data[1] = 0xA0;
        send[0].Data[2] = 0xFF;
        send[1].Data[2] = 0x00;
        send[0].Data[3] = 0x2E;
        send[1].Data[3] = 0xD2;

	//usleep(5000);
	VCI_Transmit(VCI_USBCAN2, 0, 0, &send[1], 1);
	usleep(10000);
	VCI_Transmit(VCI_USBCAN2, 0, 0, send, 1);	
        }
	
	
} 
