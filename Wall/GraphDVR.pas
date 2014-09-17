unit GraphDVR;

interface

uses
  Windows;
const MaxBlock=1024*250;
      WarnBlock=1024*150;
      //MaxBlock=35840;
type
  PDataBlock = ^TDataBlock;
  TDataBlock= record
    Cmd:array [0..4] of Char;  //����PLAY STOP JPG
    DvrIP: array [0..15] of Char;   //IP
    DvrPort:Integer;    //�˿�
    DvrChannel:Integer;//ͨ��
    PlayHWND:Integer; //���ſؼ���handle
    FrameWidth:Integer;
    FrameHeight:Integer;
    FrameFPS:Integer;
    BlockType:Integer;
    FrameNum:Integer;//֡��
    //Reserve:Integer;//����
    BlockSize:Integer;//JPGʵ�ʴ�С
    Block:array[0..MaxBlock-1] of byte;//���jpg�İ�
  end;

type
   BlockPack = record
     BufSize: integer;          //����������Ϣ�ͱ���ͼƬ��С
     WarnCount: byte;           //��������
     WarnType: Integer;           //��������
     WarnID: Byte;             //����ID
     WarnTime: int64;          //����ʱ��
     LBMPWidth: Integer;       //ͼƬ��
     LBMPHeight: Integer;      //ͼƬ��
     LBMPSize: Integer;        //ͼƬ��С
     LBMPStartPos: Integer;    //ͼƬ��ʼλ��
     LBMPEndPos: Integer;      //ͼƬ��ֹλ��
   end;


//     WarnCount: Integer;   //��������
//     BufType: Integer;     //������
//     BufBegin: Integer;    //����ʼλ��
//     BufSize: Integer;     //����С
//     WarnID: Integer;   //����ID
//     WarnIP:string;            //�����豸IP
//     Warnport: Integer;        //�����豸Port
//     Warnchannel: Integer;     //�����豸ͨ��
//     WarnTime: int64;     //����ʱ��
//     LBMPWidth: Integer;  //ͼƬ��
//     LBMPHeight: Integer; //ͼƬ��
//     LBMPSize: Integer;
//     LBMPBuf: array[0..MaxBlock-1] of byte;   //ͼƬ����

const
  ViewDLL = 'ViewDll03.dll';
  function GInitDLL(): Integer; cdecl; external ViewDLL name 'InitDLL';
  function GPlaylocalFile(INSTANCE: Integer; ViewIp: PChar; Hwnd: hwnd): Integer; cdecl; external ViewDLL name 'PlaylocalFile';
  function GStoplocalFile(INSTANCE: Integer): Integer; cdecl; external ViewDLL name 'StoplocalFile';
  function GGetIdleDecordINSTANCE(): Integer; cdecl; external ViewDLL name 'GetIdleDecordINSTANCE';
  function GSuspendLocalFile(INSTANCE: Integer):Integer; cdecl; external ViewDLL name 'SuspendLocalFile';
  function GPlayContinueLocalFile(INSTANCE: Integer):Integer; cdecl; external ViewDLL name 'PlayContinueLocalFile';


// function ConnectToVideoServer(ServerIP:PChar;ServerPort:Integer):Integer;stdcall;external 'VideoClient.dll';
//  //�Ͽ�������Ƶ������
//  function TL_NET_DisConnectToVideoServer(instance:integer): Integer; stdcall;external 'VideoClient.dll' name 'DisConnectToVideoServer';
//  //ʵʱ����
//  function TL_NET_RealPlay(instance:Integer;DvrChannel:Integer;PlayHWND:Integer):Integer;stdcall;external 'VideoClient.dll';
//  //ֹͣʵʱ����
//  function TL_NET_StopRealPlay(instance:Integer;DvrChannel:Integer;PlayHWND:Integer):Integer;stdcall;external 'VideoClient.dll';
//  //¼���ļ���ѯ
//  function TL_NET_FindRecordFile(instance:integer;DvrIP:PChar;DvrPort:Integer;DvrChannel:Integer;StartTime:TDateTime;EndTime:TDateTime):Integer;stdcall;external 'VideoClient.dll';
//  //���ļ����ƻط�
//  function TL_NET_PlayBackByFileName(instance:integer;DvrIP:PChar;DvrPort:Integer;DvrChannel:Integer;PlayHWND:Integer;RecordFileName:PChar;StartPosition:Integer;PlaySpeed:Integer):Integer;stdcall;external 'VideoClient.dll';
//  //��ʱ��ط�
//  //function TL_NET_PlayBackByFileTime(DvrIP:PChar;DvrPort:Integer;DvrChannel:Integer;StartTime:TDateTime;EndTime:TDateTime):Integer;stdcall;external 'VideoClient.dll';
//  //ֹͣ�ط�
//  function TL_NET_StopPlayBack(instance:integer;DvrIP:PChar;DvrPort:Integer;DvrChannel:Integer;PlayHWND:Integer):Integer;stdcall;external 'VideoClient.dll';
//  //���ļ���������
//  function TL_NET_DownLoadByFileName(instance:integer;DvrIP:PChar;DvrPort:Integer;DvrChannel:Integer;RecordFileName:PChar;SaveFileName:PChar):Integer;stdcall;external 'VideoClient.dll';
//  //��ʱ������
//  //function TL_NET_DownLoadByTime
//  //ֹͣ����
//  function TL_NET_StopDownLoad(instance:integer;DvrIP:PChar;DvrPort:Integer;DvrChannel:Integer):Integer;stdcall;external 'VideoClient.dll';
//  //��ʼ��CLientDLL

 //������Ƶ������
  function ConnectToVideoServer(ServerIP:PChar;ServerPort:Integer):Integer;stdcall;external 'VideoClient.dll';
  //�Ͽ�������Ƶ������
  function DisConnectToVideoServer(instance:integer): Integer; stdcall;external 'VideoClient.dll';
  //ʵʱ����
  function TL_NET_RealPlay(instance:integer;DvrChannel:Integer;PlayHWND:Integer):Integer;stdcall;external 'VideoClient.dll';
  //����IVS
    function TL_NET_PlayIVS(instance:integer;DvrChannel:Integer;PlayHWND:Integer):Integer;stdcall;external 'VideoClient.dll';
  //ֹͣʵʱ����
  function TL_NET_StopRealPlay(instance:integer;DvrChannel:Integer;PlayHWND:Integer):Integer;stdcall;external 'VideoClient.dll';
  //¼���ļ���ѯ
  function TL_NET_FindRecordFile(instance:integer;DvrIP:PChar;DvrPort:Integer;DvrChannel:Integer;StartTime:TDateTime;EndTime:TDateTime):Integer;stdcall;external 'VideoClient.dll';
  //���ļ����ƻط�
  function TL_NET_PlayBackByFileName(instance:integer;DvrIP:PChar;DvrPort:Integer;DvrChannel:Integer;PlayHWND:Integer;RecordFileName:PChar;StartPosition:Integer;PlaySpeed:Integer):Integer;stdcall;external 'VideoClient.dll';
  //��ʱ��ط�
  //function TL_NET_PlayBackByFileTime(DvrIP:PChar;DvrPort:Integer;DvrChannel:Integer;StartTime:TDateTime;EndTime:TDateTime):Integer;stdcall;external 'VideoClient.dll';
  //ֹͣ�ط�
  function TL_NET_StopPlayBack(instance:integer;DvrIP:PChar;DvrPort:Integer;DvrChannel:Integer;PlayHWND:Integer):Integer;stdcall;external 'VideoClient.dll';
  //���ļ���������
  function TL_NET_DownLoadByFileName(instance:integer;DvrIP:PChar;DvrPort:Integer;DvrChannel:Integer;RecordFileName:PChar;SaveFileName:PChar):Integer;stdcall;external 'VideoClient.dll';
  //��ʱ������
  //function TL_NET_DownLoadByTime
  //ֹͣ����
  function TL_NET_StopDownLoad(instance:integer;DvrIP:PChar;DvrPort:Integer;DvrChannel:Integer):Integer;stdcall;external 'VideoClient.dll';
  //�ı��С
  function TL_NET_Resize(instance:integer;PlayHWND:Integer;width:Integer;height:integer):Integer;stdcall; external 'VideoClient.dll';
  function initClientTCPVideo():boolean;stdcall;external 'VideoClient.dll';
  function FreeClientTCPVideo():boolean;stdcall;external 'VideoClient.dll';
  function PL_setBmpCallBacK(instance:integer;playHD:HWND;pfunc:pointer):integer;stdcall;external 'VideoClient.dll';  //
 type
  TGetPictureFrame = procedure(nFrame: PDataBlock); StdCall;


// typedef int (WINAPI *TBmpCallBack)(char*,int,int,int,int ,int ,int,HWND);
//TBmpCallBack����˵����char*��BMPbufer��,int(buferSize),bmpWidth,bmpHight,int(֡��),int(ͨ����),int(��������),HWND,���

 type
  TBmpCallBack=procedure(BMPbufer: PChar;BufferSize:Integer; BmpWidth:Integer;BmpHight:Integer;FrameNo:Integer;ChannelNo:Integer;DataType:Integer;PlayHwnd:HWND); StdCall;

procedure SetPictureFrameCallBack(aFrame: TGetPictureFrame); stdcall; external 'VideoClient.dll';

implementation

end.
