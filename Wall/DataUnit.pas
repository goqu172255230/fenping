unit DataUnit;

interface
uses
   Windows,Forms, Classes, ExtCtrls,IdBaseComponent, IdComponent,Dialogs, IdTCPConnection, IdTCPClient, SysUtils, Graphics, jpeg, IdTCPServer;
const
    imgpnlwidth = 243;
    imgpnlheight = 171;
    DVRMaxCount=16;                 //DVR����
    DecodeChannelMaxCount=64;       //����ͨ��
    MaxVideoFormCount=9;            //SCreen ����
    MaxPannelCount=16;              //��������

type
  pCmdInfo=^TCmdInfo;
  TCmdInfo=record
    Cmd: Byte;                       //1 ���� 2 ���� 0����
    isUsed:integer;                  //0 û��ʹ�� 1�Ѿ�ʹ��
    DVRType:array[0..15] of Char;
    IP:array[0..14] of Char;
    Port:Integer;
    User:array[0..15] of Char;
    Pass:array[0..15] of Char;
    DVRChannel:integer;
    videoForm:integer;               //�ڼ�����Ļ
    FormPos:integer;                 //�ڼ���С��
    RealplayHWND:Integer;            //���ŷ���ֵ
    Mode: Byte;                      //����ģʽ 0�¼� 1�޸�
    VideoCount: Integer;
end;


type
  pChannelInfo=^TchannelInfo;
  TChannelInfo=record
  isUsed:integer;//0 û��ʹ�� 1�Ѿ�ʹ��
  DVRType:string;
  IP:string;
  Port:Integer;
  User:string;
  Pass:string;
  DVRChannel:integer;
  videoForm:integer; //�ڼ�����Ļ
  FormPos:integer;   //�ڼ���С��
  RealplayHWND:Integer;  //���ŷ���ֵ
end;
type
  TDevInfo = record
    DVRName:string;
    DVRType:string;
    IP:string;
    Port:Integer;
    User:string;
    Pass:string;
    LoginID:integer;
    status:integer;//1 login -1 loginout 0 δʹ��
    channelCount:integer; //DVR��ͨ����
  end;
implementation

end.
