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
#include "control_can_motor/Motor.h"

int main(int argc, char **argv)
{
	ros::init(argc, argv, "feedback");
	ros::NodeHandle n;
	printf(">>this is first feedback node!\r\n");//指示程序已运行

	ros::Publisher motor_pub = n.advertise<control_can_motor::Motor>("motor_info", 10);
        
        VCI_CAN_OBJ send[2];
	send[0].ID=0x1A;
        send[1].ID=0x2A;

        send[0].Data[0] = 0x0A;
        send[1].Data[0] = 0x0A;
        send[0].Data[1] = 0x00;
        send[1].Data[1] = 0x00;

	int i;
        for(i = 4; i < send[0].DataLen; i++)
        {
                send[0].Data[i] = 0x55;
                send[1].Data[i] = 0x55;
        }
	
	int tran_len;
	//do
	//{
		//printf("in do while!");
		
		//if(VCI_OpenDevice(VCI_USBCAN2,0,0)==1)//打开设备
		//{
		//	printf(">>open deivce success!\n");//打开设备成功
		//}else
		//{
		//	printf(">>open deivce error!\n");
			//exit(1);
		//}
		//if(VCI_StartCAN(VCI_USBCAN2,0,0)!=1)
		//{
			//printf(">>Start CAN1 error\n");
			//VCI_CloseDevice(VCI_USBCAN2,0);
		//}
		//usleep(6000);
		//tran_len = VCI_Transmit(VCI_USBCAN2, 0, 0, send, 2);
	//}
        //while(tran_len!= 2);
	
	printf("setting succes!");

	usleep(100000);//延时100ms。
	
	ros::Rate loop_rate(10);
	int reclen=0;
        int ind=0;
	VCI_CAN_OBJ rec[3000];//接收缓存，设为3000为佳。
	while(ros::ok())
	{
		printf("in while!");
         	if((reclen=VCI_Receive(VCI_USBCAN2,0,ind,rec,3000,100))>0)//调用接收函数，如果有数据，进行数据处理显示。
         	{
			printf("publish success!");
                	i=reclen-1;
			control_can_motor::Motor motor_real;
			motor_real.current=(rec[i].Data[0]<<8)|rec[i].Data[1];
			motor_real.velocity=(rec[i].Data[2]<<8)|rec[i].Data[3];
			motor_real.position=(rec[i].Data[4]<<24)|(rec[i].Data[3]<<16)|(rec[i].Data[2]<<8)|rec[i].Data[1];
			motor_pub.publish(motor_real);
                  }

	        else
       		 {
               		 printf("receive2 fail!\n");
       		 }
		loop_rate.sleep();
	}
	usleep(1000000);//延时100ms。
	VCI_CloseDevice(VCI_USBCAN2,0);//关闭设备。
	//除收发函数外，其它的函数调用前后，最好加个毫秒级的延时，即不影响程序的运行，又可以让USBCAN设备有充分的时间处理指令。
	return 0;
}
