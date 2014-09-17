unit HCNetSDKUnit;

interface

uses windows, DataUnit;

//#include "stdafx.h"
//#define NET_DVR_API  extern "C"__declspec(dllimport)
type
  LONG = LongInt;
  USHORT = word;
  Bool = Boolean;
  Int = Integer;

  Char_2 = array[0..1] of char;
  Char_4 = array[0..3] of char;
  Char_6 = array[0..5] of char;
  Char_16 = array[0..15] of char;
  Char_20 = array[0..19] of char;
  Char_32 = array[0..31] of char;
  Char_48 = array[0..47] of char;
  Char_128 = array[0..47] of char;


const
  NET_DVR_API = 'HCNetSDK.dll';
  {
  NET_DVR_NOERROR 	       =	   	0  ;     //û�д���
  NET_DVR_PASSWORD_ERROR       =	   	1  ;     //�û����������
  NET_DVR_NOENOUGHPRI 	       =		2  ;     //Ȩ�޲���
  NET_DVR_NOINIT 	       =	   	3  ;     //û�г�ʼ��
  NET_DVR_CHANNEL_ERROR        =	        4  ;     //ͨ���Ŵ���
  NET_DVR_OVER_MAXLINK         =		5  ;     //���ӵ�DVR�Ŀͻ��˸����������
  NET_DVR_VERSIONNOMATCH       =		6  ;     //�汾��ƥ��
  NET_DVR_NETWORK_FAIL_CONNECT =               	7  ;     //���ӷ�����ʧ��
  NET_DVR_NETWORK_SEND_ERROR   =		8  ;     //�����������ʧ��
  NET_DVR_NETWORK_RECV_ERROR   =		9  ;     //�ӷ�������������ʧ��
  NET_DVR_NETWORK_RECV_TIMEOUT =	        10 ;     //�ӷ������������ݳ�ʱ
  NET_DVR_NETWORK_ERRORDATA    =	        11 ;     //���͵���������
  NET_DVR_ORDER_ERROR	       =		12 ;     //���ô������
  NET_DVR_OPERNOPERMIT	       =        	13 ;     //�޴�Ȩ��
  NET_DVR_COMMANDTIMEOUT       =	   	14 ;     //DVR����ִ�г�ʱ
  NET_DVR_ERRORSERIALPORT      =	   	15 ;     //���ںŴ���
  NET_DVR_ERRORALARMPORT       =	  	16 ;     //�����˿ڴ���
  NET_DVR_PARAMETER_ERROR      =		17 ;     //��������
  NET_DVR_CHAN_EXCEPTION       =	  	18 ;	//������ͨ�����ڴ���״̬
  NET_DVR_NODISK	       =	  	19 ;	//û��Ӳ��
  NET_DVR_ERRORDISKNUM	       =		20 ;	//Ӳ�̺Ŵ���
  NET_DVR_DISK_FULL	       =	   	21 ;	//������Ӳ����
  NET_DVR_DISK_ERROR	       =	   	22 ;	//������Ӳ�̳���
  NET_DVR_NOSUPPORT	       =	   	23 ;	//��������֧��
  NET_DVR_BUSY		       =	   	24 ;	//������æ
  NET_DVR_MODIFY_FAIL	       =	   	25 ;	//�������޸Ĳ��ɹ�
  NET_DVR_PASSWORD_FORMAT_ERROR	=               26 ;	//���������ʽ����ȷ
  NET_DVR_DISK_FORMATING       = 		27 ;	//Ӳ�����ڸ�ʽ����������������
  NET_DVR_DVRNORESOURCE	       =		28 ;	//DVR��Դ����
  NET_DVR_DVROPRATEFAILED      =		29 ;     //DVR����ʧ��
  NET_DVR_OPENHOSTSOUND_FAIL   =	        30 ;     //��PC����ʧ��
  NET_DVR_DVRVOICEOPENED       =		31 ;     //�����������Խ���ռ��
  NET_DVR_TIMEINPUTERROR       =		32 ;     //ʱ�����벻��ȷ
  NET_DVR_NOSPECFILE	       = 		33 ;     //�ط�ʱ������û��ָ�����ļ�
  NET_DVR_CREATEFILE_ERROR     =		34 ;	//�����ļ�����
  NET_DVR_FILEOPENFAIL	       =		35 ;     //���ļ�����
  NET_DVR_OPERNOTFINISH	       =		36 ;     //�ϴεĲ�����û�����
  NET_DVR_GETPLAYTIMEFAIL      =    		37 ;     //��ȡ��ǰ���ŵ�ʱ�����
  NET_DVR_PLAYFAIL	       =    		38 ;     //���ų���
  NET_DVR_FILEFORMAT_ERROR     =		39 ;     //�ļ���ʽ����ȷ
  NET_DVR_DIR_ERROR	       =    		40 ;	//·������
  NET_DVR_ALLOC_RESOUCE_ERROR  =		41 ;     //��Դ�������
  NET_DVR_AUDIO_MODE_ERROR     =		42 ;	//����ģʽ����
  NET_DVR_NOENOUGH_BUF	       =		43 ;	//������̫С
  NET_DVR_CREATESOCKET_ERROR   =		44 ;	//����SOCKET����
  NET_DVR_SETSOCKET_ERROR      =    		45 ;	//����SOCKET����
  NET_DVR_MAX_NUM	       =    		46 ;	//�����ﵽ���
  NET_DVR_USERNOTEXIST	       =		47 ;	//�û�������
  NET_DVR_WRITEFLASHERROR      =    		48 ;     //дFLASH����
  NET_DVR_UPGRADEFAIL	       =    		49 ;     //DVR����ʧ��
  NET_DVR_CARDHAVEINIT	       =		50 ;     //���뿨�Ѿ���ʼ����
  NET_DVR_PLAYERFAILED	       =		51 ;	//�������д���
  NET_DVR_MAX_USERNUM	       =    		52 ;     //�û����ﵽ���
  NET_DVR_GETLOCALIPANDMACFAIL	=               53 ;     //��ÿͻ��˵�IP��ַ�������ַʧ��
  NET_DVR_NOENCODEING		=		54 ;	//��ͨ��û�б���
  NET_DVR_IPMISMATCH		=		55 ;	//IP��ַ��ƥ��
  NET_DVR_MACMISMATCH		=		56 ;	//MAC��ַ��ƥ��
  NET_DVR_UPGRADELANGMISMATCH	=       	57 ;	//�����ļ����Բ�ƥ��
  NET_DVR_DDRAWDEVICENOSUPPORT	=       	58 ;	//�����Կ���֧��
  }
  NET_DVR_NOERROR = 0; //û�д���
  NET_DVR_PASSWORD_ERROR = 1; //�û����������
  NET_DVR_NOENOUGHPRI = 2; //Ȩ�޲���
  NET_DVR_NOINIT = 3; //û�г�ʼ��
  NET_DVR_CHANNEL_ERROR = 4; //ͨ���Ŵ���
  NET_DVR_OVER_MAXLINK = 5; //���ӵ�DVR�Ŀͻ��˸����������
  NET_DVR_VERSIONNOMATCH = 6; //�汾��ƥ��
  NET_DVR_NETWORK_FAIL_CONNECT = 7; //���ӷ�����ʧ��
  NET_DVR_NETWORK_SEND_ERROR = 8; //�����������ʧ��
  NET_DVR_NETWORK_RECV_ERROR = 9; //�ӷ�������������ʧ��
  NET_DVR_NETWORK_RECV_TIMEOUT = 10; //�ӷ������������ݳ�ʱ
  NET_DVR_NETWORK_ERRORDATA = 11; //���͵���������
  NET_DVR_ORDER_ERROR = 12; //���ô������
  NET_DVR_OPERNOPERMIT = 13; //�޴�Ȩ��
  NET_DVR_COMMANDTIMEOUT = 14; //DVR����ִ�г�ʱ
  NET_DVR_ERRORSERIALPORT = 15; //���ںŴ���
  NET_DVR_ERRORALARMPORT = 16; //�����˿ڴ���
  NET_DVR_PARAMETER_ERROR = 17; //��������
  NET_DVR_CHAN_EXCEPTION = 18; //������ͨ�����ڴ���״̬
  NET_DVR_NODISK = 19; //û��Ӳ��
  NET_DVR_ERRORDISKNUM = 20; //Ӳ�̺Ŵ���
  NET_DVR_DISK_FULL = 21; //������Ӳ����
  NET_DVR_DISK_ERROR = 22; //������Ӳ�̳���
  NET_DVR_NOSUPPORT = 23; //��������֧��
  NET_DVR_BUSY = 24; //������æ
  NET_DVR_MODIFY_FAIL = 25; //�������޸Ĳ��ɹ�
  NET_DVR_PASSWORD_FORMAT_ERROR = 26; //���������ʽ����ȷ
  NET_DVR_DISK_FORMATING = 27; //Ӳ�����ڸ�ʽ����������������
  NET_DVR_DVRNORESOURCE = 28; //DVR��Դ����
  NET_DVR_DVROPRATEFAILED = 29; //DVR����ʧ��
  NET_DVR_OPENHOSTSOUND_FAIL = 30; //��PC����ʧ��
  NET_DVR_DVRVOICEOPENED = 31; //�����������Խ���ռ��
  NET_DVR_TIMEINPUTERROR = 32; //ʱ�����벻��ȷ
  NET_DVR_NOSPECFILE = 33; //�ط�ʱ������û��ָ�����ļ�
  NET_DVR_CREATEFILE_ERROR = 34; //�����ļ�����
  NET_DVR_FILEOPENFAIL = 35; //���ļ�����
  NET_DVR_OPERNOTFINISH = 36; //�ϴεĲ�����û�����
  NET_DVR_GETPLAYTIMEFAIL = 37; //��ȡ��ǰ���ŵ�ʱ�����
  NET_DVR_PLAYFAIL = 38; //���ų���
  NET_DVR_FILEFORMAT_ERROR = 39; //�ļ���ʽ����ȷ
  NET_DVR_DIR_ERROR = 40; //·������
  NET_DVR_ALLOC_RESOURCE_ERROR = 41; //��Դ�������
  NET_DVR_AUDIO_MODE_ERROR = 42; //����ģʽ����
  NET_DVR_NOENOUGH_BUF = 43; //������̫С
  NET_DVR_CREATESOCKET_ERROR = 44; //����SOCKET����
  NET_DVR_SETSOCKET_ERROR = 45; //����SOCKET����
  NET_DVR_MAX_NUM = 46; //�����ﵽ���
  NET_DVR_USERNOTEXIST = 47; //�û�������
  NET_DVR_WRITEFLASHERROR = 48; //дFLASH����
  NET_DVR_UPGRADEFAIL = 49; //DVR����ʧ��
  NET_DVR_CARDHAVEINIT = 50; //���뿨�Ѿ���ʼ����
  NET_DVR_PLAYERFAILED = 51; //���ò��ſ���ĳ������ʧ��
  NET_DVR_MAX_USERNUM = 52; //�豸���û����ﵽ���
  NET_DVR_GETLOCALIPANDMACFAIL = 53; //��ÿͻ��˵�IP��ַ�������ַʧ��
  NET_DVR_NOENCODEING = 54; //��ͨ��û�б���
  NET_DVR_IPMISMATCH = 55; //IP��ַ��ƥ��
  NET_DVR_MACMISMATCH = 56; //MAC��ַ��ƥ��
  NET_DVR_UPGRADELANGMISMATCH = 57; //�����ļ����Բ�ƥ��
  NET_DVR_MAX_PLAYERPORT = 58; //������·���ﵽ���
  NET_DVR_NOSPACEBACKUP = 59; //�����豸��û���㹻�ռ���б���
  NET_DVR_NODEVICEBACKUP = 60; //û���ҵ�ָ���ı����豸
  NET_DVR_PICTURE_BITS_ERROR = 61; //ͼ����λ����������24ɫ
  NET_DVR_PICTURE_DIMENSION_ERROR = 62; //ͼƬ��*���ޣ�
  NET_DVR_PICTURE_SIZ_ERROR = 63; //ͼƬ��С���ޣ���100K
  NET_DVR_LOADPLAYERSDKFAILED = 64; //���뵱ǰĿ¼��Player
  NET_DVR_LOADPLAYERSDKPROC_ERROR = 65; //�Ҳ���Player
  NET_DVR_LOADDSSDKFAILED = 66; //���뵱ǰĿ¼��DSsdk����
  NET_DVR_LOADDSSDKPROC_ERROR = 67; //�Ҳ���DsSdk��ĳ���������
  NET_DVR_DSSDK_ERROR = 68; //����Ӳ�����DsSdk��ĳ������ʧ��
  NET_DVR_VOICEMONOPOLIZE = 69; //��������ռ
  NET_DVR_JOINMULTICASTFAILED = 70; //����ಥ��ʧ��
  NET_DVR_CREATEDIR_ERROR = 71; //������־�ļ�Ŀ¼ʧ��
  NET_DVR_BINDSOCKET_ERROR = 72; //���׽���ʧ��
  NET_DVR_SOCKETCLOSE_ERROR = 73; //socket�����жϣ��˴���ͨ�������������жϻ�Ŀ�ĵز��ɴ�
  NET_DVR_USERID_ISUSING = 74; //ע��ʱ�û�ID���ڽ���ĳ����
  NET_DVR_SOCKETLISTEN_ERROR = 75; //����ʧ��
  NET_DVR_PROGRAM_EXCEPTION = 76; //�����쳣
  NET_DVR_WRITEFILE_FAILED = 77; //д�ļ�ʧ��
  NET_DVR_FORMAT_READONLY = 78; //��ֹ��ʽ��ֻ��Ӳ��
  NET_DVR_WITHSAMEUSERNAME = 79; //�û����ýṹ�д�����ͬ���û���
  NET_DVR_DEVICETYPE_ERROR = 80; //�������ʱ�豸�ͺŲ�ƥ��
  NET_DVR_LANGUAGE_ERROR = 81; //�������ʱ���Բ�ƥ��
  NET_DVR_PARAVERSION_ERROR = 82; //�������ʱ����汾��ƥ��
  NET_DVR_IPCHAN_NOTALIVE = 83; //Ԥ��ʱ���IPͨ��������
  NET_DVR_RTSP_SDK_ERROR = 84; //���ظ���IPCͨѶ��StreamTransClientʧ��
  NET_DVR_CONVERT_SDK_ERROR = 85; //����ת���ʧ��
  NET_DVR_IPC_COUNT_OVERFLOW = 86; //��������IP����ͨ����

  MAX_CHANNUM_V30=64;
  MAX_ALARMOUT_V30=96;
  MAX_DISKNUM_V30=33;
  MAX_ALARMIN_V30=160;
  MAX_AUDIO_V30=2;
  
//�����ļ�����־��������ֵ
  NET_DVR_FILE_SUCCESS = 1000; //����ļ���Ϣ
  NET_DVR_FILE_NOFIND = 1001; //û���ļ�
  NET_DVR_ISFINDING = 1002; //���ڲ����ļ�
  NET_DVR_NOMOREFILE = 1003; //�����ļ�ʱû�и�����ļ�
  NET_DVR_FILE_EXCEPTION = 1004; //�����ļ�ʱ�쳣

//NET_DVR_IsSupport()����ֵ
//1��9λ�ֱ��ʾ������Ϣ��λ����TRUE)��ʾ֧�֣�
  NET_DVR_SUPPORT_DDRAW = $01; //֧��DIRECTDRAW�������֧�֣��򲥷������ܹ�����
  NET_DVR_SUPPORT_BLT = $02; //�Կ�֧��BLT�����������֧�֣��򲥷������ܹ�����
  NET_DVR_SUPPORT_BLTFOURCC = $04; //�Կ�BLT֧����ɫת���������֧�֣��������������������RGBת����
  NET_DVR_SUPPORT_BLTSHRINKX = $08; //�Կ�BLT֧��X����С�������֧�֣�ϵͳ�����������ת����
  NET_DVR_SUPPORT_BLTSHRINKY = $10; //�Կ�BLT֧��Y����С�������֧�֣�ϵͳ�����������ת����
  NET_DVR_SUPPORT_BLTSTRETCHX = $20; //�Կ�BLT֧��X��Ŵ������֧�֣�ϵͳ�����������ת����
  NET_DVR_SUPPORT_BLTSTRETCHY = $40; //�Կ�BLT֧��Y��Ŵ������֧�֣�ϵͳ�����������ת����
  NET_DVR_SUPPORT_SSE = $80; //CPU֧��SSEָ�Intel Pentium3����֧��SSEָ�
  NET_DVR_SUPPORT_MMX = $100; //CPU֧��MMXָ���Intel Pentium3����֧��SSEָ�

  SET_PRESET = 8; // ����Ԥ�õ�
  CLE_PRESET = 9; // ���Ԥ�õ�
  GOTO_PRESET = 39; // ת��Ԥ�õ�

  LIGHT_PWRON = 2; //* ��ͨ�ƹ��Դ */
  WIPER_PWRON = 3; //* ��ͨ��ˢ���� */
  FAN_PWRON = 4; //* ��ͨ���ȿ��� */
  HEATER_PWRON = 5; //* ��ͨ���������� */
  AUX_PWRON1 = 6; //* ��ͨ�����豸���� */
  AUX_PWRON2 = 7;
  ZOOM_IN = 11; //* �������ٶ�SS���(���ʱ��) */
  ZOOM_OUT = 12; //* �������ٶ�SS��С(���ʱ�С) */
  FOCUS_NEAR = 13; //* �������ٶ�SSǰ�� */
  FOCUS_FAR = 14; //* �������ٶ�SS��� */
  IRIS_OPEN = 15; //* ��Ȧ���ٶ�SS���� */
  IRIS_CLOSE = 16; //* ��Ȧ���ٶ�SS��С */
  TILT_UP = 21; //* ��̨��SS���ٶ����� */
  TILT_DOWN = 22; //* ��̨��SS���ٶ��¸� */
  PAN_LEFT = 23; //* ��̨��SS���ٶ���ת */
  PAN_RIGHT = 24; //* ��̨��SS���ٶ���ת */
  PAN_AUTO = 29; //* ��̨��SS���ٶ������Զ�ɨ�� */

  RUN_CRUISE = 36; //* ��ʼ�켣 */
  RUN_SEQ = 37; //* ��ʼѲ�� */
  STOP_SEQ = 38; //* ֹͣѲ�� */
  FILL_PRE_SEQ = 30;
  SET_SEQ_DWELL = 31;
  SET_SEQ_SPEED = 32;
  CLE_PRE_SEQ = 33; //��Ԥ�õ��Ѳ��������ɾ��

const
  //��ʾģʽ
  NORMALMODE = 0;
  OVERLAYMODE = 1;

type
//����ģʽ
  TSendMode = (PTOPTCPMODE, PTOPUDPMODE, MULTIMODE, RTPMODE, AUDIODETACH, NOUSEMODE);

const
  NET_DVR_SYSHEAD = 1; //ϵͳͷ����
  NET_DVR_STREAMDATA = 2; //������

//���ſ�������궨�� NET_DVR_PlayBackControl,NET_DVR_PlayControlLocDisplay,NET_DVR_DecPlayBackCtrl�ĺ궨��
  NET_DVR_PLAYSTART = 1; //��ʼ����
  NET_DVR_PLAYSTOP = 2; //ֹͣ����
  NET_DVR_PLAYPAUSE = 3; //��ͣ����
  NET_DVR_PLAYRESTART = 4; //�ָ�����
  NET_DVR_PLAYFAST = 5; //���
  NET_DVR_PLAYSLOW = 6; //����
  NET_DVR_PLAYNORMAL = 7; //�����ٶ�
  NET_DVR_PLAYFRAME = 8; //��֡��
  NET_DVR_PLAYSTARTAUDIO = 9; //������
  NET_DVR_PLAYSTOPAUDIO = 10; //�ر�����
  NET_DVR_PLAYAUDIOVOLUME = 11; //��������
  NET_DVR_PLAYSETPOS = 12; //�ı��ļ��طŵĽ���
  NET_DVR_PLAYGETPOS = 13; //��ȡ�ļ��طŵĽ���
  NET_DVR_PLAYGETTIME = 14; //��ȡ��ǰ�Ѿ����ŵ�ʱ��
  NET_DVR_PLAYGETFRAME = 15; //��ȡ��ǰ�Ѿ����ŵ�֡��
  NET_DVR_GETTOTALFRAMES = 16; //��ȡ��ǰ�����ļ��ܵ�֡��
  NET_DVR_GETTOTALTIME = 17; //��ȡ��ǰ�����ļ��ܵ�ʱ��
  NET_DVR_THROWBFRAME_ = 20; //��B֡

//NET_DVR_GetDVRConfig,NET_DVR_GetDVRConfig�������
  NET_DVR_GET_DEVICECFG = 100; //��ȡ�豸����
  NET_DVR_SET_DEVICECFG = 101; //�����豸����
  NET_DVR_GET_NETCFG = 102; //��ȡ�������
  NET_DVR_SET_NETCFG = 103; //�����������
  NET_DVR_GET_PICCFG = 104; //��ȡͼ�����
  NET_DVR_SET_PICCFG = 105; //����ͼ�����
  NET_DVR_GET_COMPRESSCFG = 106; //��ȡѹ������
  NET_DVR_SET_COMPRESSCFG = 107; //����ѹ������
  NET_DVR_GET_COMPRESSCFG_EX = 204; //��ȡѹ������(��չ)
  NET_DVR_SET_COMPRESSCFG_EX = 205; //����ѹ������(��չ)
  NET_DVR_GET_RECORDCFG = 108; //��ȡ¼��ʱ�����
  NET_DVR_SET_RECORDCFG = 109; //����¼��ʱ�����
  NET_DVR_GET_DECODERCFG = 110; //��ȡ����������
  NET_DVR_SET_DECODERCFG = 111; //���ý���������
  NET_DVR_GET_RS232CFG = 112; //��ȡ232���ڲ���
  NET_DVR_SET_RS232CFG = 113; //����232���ڲ���
  NET_DVR_GET_ALARMINCFG = 114; //��ȡ�����������
  NET_DVR_SET_ALARMINCFG = 115; //���ñ����������
  NET_DVR_GET_ALARMOUTCFG = 116; //��ȡ�����������
  NET_DVR_SET_ALARMOUTCFG = 117; //���ñ����������
  NET_DVR_GET_TIMECFG = 118; //��ȡDVRʱ��
  NET_DVR_SET_TIMECFG = 119; //����DVRʱ��
  NET_DVR_GET_PREVIEWCFG = 120; //��ȡԤ������
  NET_DVR_SET_PREVIEWCFG = 121; //����Ԥ������
  NET_DVR_GET_VIDEOOUTCFG = 122; //��ȡ��Ƶ�������
  NET_DVR_SET_VIDEOOUTCFG = 123; //������Ƶ�������
  NET_DVR_GET_USERCFG = 124; //��ȡ�û�����
  NET_DVR_SET_USERCFG = 125; //�����û�����
  NET_DVR_GET_EXCEPTIONCFG = 126; //��ȡ�쳣����
  NET_DVR_SET_EXCEPTIONCFG = 127; //�����쳣����
  NET_DVR_GET_SHOWSTRING = 130; //��ȡ�����ַ�����
  NET_DVR_SET_SHOWSTRING = 131; //���õ����ַ�����
  NET_DVR_GET_AUXOUTCFG = 140; //��ȡ�����������
  NET_DVR_SET_AUXOUTCFG = 141; //���ø����������
//2006-04-13 -sϵ��˫���
  NET_DVR_GET_PREVIEWCFG_AUX = 142; //��ȡԤ������
  NET_DVR_SET_PREVIEWCFG_AUX = 143; //����Ԥ������
  NET_DVR_GET_PICCFG_EX = 200; //��ȡͼ���������չ��
  NET_DVR_SET_PICCFG_EX = 201; //����ͼ���������չ��
  NET_DVR_GET_USERCFG_EX = 202; //��ȡ�û�����
  NET_DVR_SET_USERCFG_EX = 203; //�����û�����

//�ص���������
  COMM_ALARM = $1100; //������Ϣ
  COMM_TRADEINFO = $1500; //ATMDVR�����ϴ�������Ϣ

//��Ϣ��ʽ
//�쳣����
  EXCEPTION_AUDIOEXCHANGE = $8001; //�����Խ��쳣
  EXCEPTION_ALARM = $8002; //�����쳣
  EXCEPTION_PREVIEW = $8003; //����Ԥ���쳣
  EXCEPTION_SERIAL = $8004; //͸��ͨ���쳣
  EXCEPTION_RECONNECT = $8005; //Ԥ��ʱ����

  NAME_LEN = 32;
  SERIALNO_LEN = 48;
  MACADDR_LEN = 6;
  MAX_ETHERNET = 2;
  PATHNAME_LEN = 128;
  PASSWD_LEN = 16;
  MAX_CHANNUM = 16;
  MAX_ALARMOUT = 4;
  MAX_TIMESEGMENT = 4;
  MAX_PRESET = 128;
  MAX_DAYS = 7;
  PHONENUMBER_LEN = 32;
  MAX_DISKNUM = 16;
  MAX_WINDOW = 16;
  MAX_VGA = 1;
  MAX_USERNUM = 16;
  MAX_EXCEPTIONNUM = 16;
  MAX_LINK = 6;
  MAX_ALARMIN = 16;
  MAX_VIDEOOUT = 2;
  MAX_NAMELEN = 16; //DVR���ص�½��
  MAX_RIGHT = 32; //Ȩ��
  CARDNUM_LEN = 20;
  MAX_SHELTERNUM = 4; //�ڵ�������
  MAX_DECPOOLNUM = 4;
  MAX_DECNUM = 4;
  MAX_TRANSPARENTNUM = 2;
  MAX_STRINGNUM = 4;
  MAX_AUXOUT = 4;

//* ����ӿڶ��� */
  NET_IF_10M_HALF = 1; //* 10M ethernet */
  NET_IF_10M_FULL = 2;
  NET_IF_100M_HALF = 3; //* 100M ethernet */
  NET_IF_100M_FULL = 4;
  NET_IF_AUTO = 5;

//�豸�ͺ�(DVR����)
  DVR = 1;
  ATMDVR = 2;
  DVS = 3;
  DEC1 = 4; //* 6001D */
  ENC_DEC = 5; //* 6001F */
  DVR_HC = 6;
  DVR_HT = 7;
  DVR_HF = 8;
  DVR_HS = 9;
  DVR_HTS = 10;
  DVR_HB = 11;
  DVR_HCS = 12;
  DVS_A = 13;
  DVR_HC_S = 14;
  DVR_HT_S = 15;
  DVR_HF_S = 16;
  DVR_HS_S = 17;
  ATMDVR_S = 18;
  LOWCOST_DVR = 19;

type

  LPNET_DVR_DEVICEINFO = ^NET_DVR_DEVICEINFO;
  NET_DVR_DEVICEINFO = record
    sSerialNumber: array[0..SERIALNO_LEN - 1] of Char; //���к�
    byAlarmInPortNum: BYTE; //DVR�����������
    byAlarmOutPortNum: BYTE; //DVR�����������
    byDiskNum: BYTE; //DVR Ӳ�̸���
    byDVRType: BYTE; //DVR����,
    byChanNum: BYTE; //DVR ͨ������
    byStartChan: BYTE; //��ʼͨ����,����DVS-1,DVR - 1
  end;

//NET_DVR_Login_V30()�����ṹ
type LPNET_DVR_DEVICEINFO_V30 = ^NET_DVR_DEVICEINFO_V30;
  NET_DVR_DEVICEINFO_V30 = record
    sSerialNumber: array[1..SERIALNO_LEN] of char; //���к�
    byAlarmInPortNum: BYTE; //�����������
    byAlarmOutPortNum: BYTE; //�����������
    byDiskNum: BYTE; //Ӳ�̸���
    byDVRType: BYTE; //�豸����, 1:DVR 2:ATM DVR 3:DVS ......
    byChanNum: BYTE; //ģ��ͨ������
    byStartChan: BYTE; //��ʼͨ����,����DVS-1,DVR - 1
    byAudioChanNum: BYTE; //����ͨ����
    byIPChanNum: BYTE; //�������ͨ������
    byRes1: array[1..24] of BYTE; //����

  end;

//Ԥ������
  LPNET_DVR_DISPLAY_PARA = ^NET_DVR_DISPLAY_PARA;
  NET_DVR_DISPLAY_PARA = record
    bToScreen: long;
    bToVideoOut: long;
    nLeft: long;
    nTop: long;
    nWidth: long;
    nHeight: long;
    nReserved: long;
  end;

  LPNET_DVR_CLIENTINFO = ^NET_DVR_CLIENTINFO;
  NET_DVR_CLIENTINFO = record
    lChannel: LONG; //ͨ����                                //   10000000000000000000000000000000     2147483648   $80000000
    lLinkMode: LONG; //���λ(31)Ϊ0��ʾ��������Ϊ1��ʾ��������0��30λ��ʾ�������ӷ�ʽ: 0��TCP��ʽ,1��UDP��ʽ,2���ಥ��ʽ,3 - RTP��ʽ��4-����Ƶ�ֿ�(TCP)
    hPlayWnd: HWND; //���Ŵ��ڵľ��,ΪNULL��ʾ������ͼ��
    sMultiCastIP: PChar; //�ಥ���ַ
  end;

  LPNET_DVR_CLIENTINFO_V40 = ^NET_DVR_CLIENTINFO_V40;
  NET_DVR_CLIENTINFO_V40 = record
    lChannel: LONG; //ͨ����
    dwStreamType: LONG;   // �������ͣ�0-��������1-��������2-����3��3-����4 ���Դ�����
    lLinkMode: LONG; //���λ(31)Ϊ0��ʾ��������Ϊ1��ʾ��������0��30λ��ʾ�������ӷ�ʽ: 0��TCP��ʽ,1��UDP��ʽ,2���ಥ��ʽ,3 - RTP��ʽ��4-����Ƶ�ֿ�(TCP)
    hPlayWnd: HWND; //���Ŵ��ڵľ��,ΪNULL��ʾ������ͼ��
    bBlocked: Boolean;        //0-������ȡ��, 1-����ȡ��, �������SDK�ڲ�connectʧ�ܽ�����5s�ĳ�ʱ���ܹ�����,���ʺ�����ѯȡ������.
    bPassbackRecord: Boolean;  //0-������¼��ش�,1����¼��ش�
    byPreviewMode: Byte;    //Ԥ��ģʽ��0-����Ԥ����1-�ӳ�Ԥ��
    byRes: array[0..254] of Byte;
    sMultiCastIP: PChar; //�ಥ���ַ
  end;

  LPNET_DVR_CARDINFO = ^NET_DVR_CARDINFO;
  NET_DVR_CARDINFO = record
    lChannel: LONG; //ͨ����
    lLinkMode: LONG; //���λ(31)Ϊ0��ʾ��������Ϊ1��ʾ��������0��30λ��ʾ�������ӷ�ʽ: 0��TCP��ʽ,1��UDP��ʽ,2���ಥ��ʽ,3 - RTP��ʽ��4-�绰�ߣ�5��128k�����6��256k�����7��384k�����8��512k�����
    sMultiCastIP: PChar;
    struDisplayPara: NET_DVR_DISPLAY_PARA;
  end;

  LPNET_DVR_TIME = ^NET_DVR_TIME;
  NET_DVR_TIME = record
    dwYear: DWORD; //��
    dwMonth: DWORD; //��
    dwDay: DWORD; //��
    dwHour: DWORD; //ʱ
    dwMinute: DWORD; //��
    dwSecond: DWORD; //��
  end;

  LPNET_DVR_SCHEDTIME = ^NET_DVR_SCHEDTIME;
  NET_DVR_SCHEDTIME = record
    //��ʼʱ��
    byStartHour: BYTE;
    byStartMin: BYTE;
    //����ʱ��
    byStopHour: BYTE;
    byStopMin: BYTE;
  end;

const
//*����ʽ*/
  NOACTION = 0; //*����Ӧ*/
  WARNONMONITOR = 1; //*�������Ͼ���*/
  WARNONAUDIOOUT = 2; //*��������*/
  UPTOCENTER = 4; //*�ϴ�����*/
  TRIGGERALARMOUT = 8; //*�����������*/

type

  LPNET_DVR_HANDLEEXCEPTION = ^NET_DVR_HANDLEEXCEPTION;
  NET_DVR_HANDLEEXCEPTION = record
    dwHandleType: DWORD; //*����ʽ,����ʽ��"��"���*/
 //*$00: ����Ӧ*/
 //*$01: �������Ͼ���*/
 //*$02: ��������*/
 //*$04: �ϴ�����*/
 //*$08: �����������*/
    byRelAlarmOut: array[0..MAX_ALARMOUT - 1] of BYTE; //�������������ͨ��,�������������,Ϊ1��ʾ���������
  end;

  //DVR�豸����
  LPNET_DVR_DEVICECFG = ^NET_DVR_DEVICECFG;
  NET_DVR_DEVICECFG = record
    dwSize: DWORD;
    sDVRName: array[0..NAME_LEN - 1] of BYTE; //DVR����
    dwDVRID: DWORD; //DVR ID,����ң����
    dwRecycleRecord: DWORD; //�Ƿ�ѭ��¼��,0:����; 1:��
        //���²��ܸ���
    sSerialNumber: array[0..SERIALNO_LEN - 1] of BYTE; //���к�
    dwSoftwareVersion: DWORD; // ����汾��,��16λ�����汾,��16λ�Ǵΰ汾
    dwSoftwareBuildDate: DWORD; // �����������,$YYYYMMDD
    dwDSPSoftwareVersion: DWORD; // DSP����汾,��16λ�����汾,��16λ�Ǵΰ汾
    dwDSPSoftwareBuildDate: DWORD; // DSP�����������,$YYYYMMDD
    dwPanelVersion: DWORD; // ǰ���汾,��16λ�����汾,��16λ�Ǵΰ汾
    dwHardwareVersion: DWORD; // Ӳ���汾,��16λ�����汾,��16λ�Ǵΰ汾
    byAlarmInPortNum: BYTE; // DVR�����������
    byAlarmOutPortNum: BYTE; // DVR�����������
    byRS232Num: BYTE; // DVR 232���ڸ���
    byRS485Num: BYTE; // DVR 485���ڸ���
    byNetworkPortNum: BYTE; // ����ڸ���
    byDiskCtrlNum: BYTE; // DVR Ӳ�̿���������
    byDiskNum: BYTE; // DVR Ӳ�̸���
    byDVRType: BYTE; //DVR����,
    byChanNum: BYTE; //DVR ͨ������
    byStartChan: BYTE; //��ʼͨ����,����DVS-1,DVR - 1
    byDecordChans: BYTE; //DVR ����·��
    byVGANum: BYTE; //VGA�ڵĸ���
    byUSBNum: BYTE; //USB�ڵĸ���
    reservedData: array[0..2] of Char; //����
  end;


  LPNET_DVR_ETHERNET = ^NET_DVR_ETHERNET;
  NET_DVR_ETHERNET = record
    sDVRIP: char_16; //DVR IP��ַ
    sDVRIPMask: char_16; // DVR IP��ַ����
    dwNetInterface: DWORD; //����ӿ� 1-10MBase-T 2-10MBase-Tȫ˫�� 3-100MBase-TX 4-100Mȫ˫�� 5-10M/100M����Ӧ
    wDVRPort: WORD; //�˿ں�
    byMACAddr: array[0..MACADDR_LEN - 1] of BYTE; //�������������ַ
  end;

//�������ýṹ
  LPNET_DVR_NETCFG = ^NET_DVR_NETCFG;
  NET_DVR_NETCFG = record
    dwSize: DWORD;
    struEtherNet: array[0..MAX_ETHERNET - 1] of NET_DVR_ETHERNET; //* ��̫���� */
    sManageHostIP: char_16; //Զ�̹���������ַ
    wManageHostPort: WORD; //Զ�̹��������˿ں�
    sDNSIP: char_16; //DNS��������ַ
    sMultiCastIP: char_16; //�ಥ���ַ
    sGatewayIP: char_16; //���ص�ַ
    sNFSIP: char_16; //NAS����IP��ַ
    sNFSDirectory: array[0..PATHNAME_LEN - 1] of BYTE; //NASĿ¼
    dwPPPOE: DWORD; //0-������,1-����
    sPPPoEUser: array[0..NAME_LEN - 1] of byte; //PPPoE�û���
    sPPPoEPassword: array[0..PASSWD_LEN - 1] of char; // PPPoE����
    sPPPoEIP: char_16; //PPPoE IP��ַ(ֻ��)
    wHttpPort: WORD; //HTTP�˿ں�
  end;

//ͨ��ͼ��ṹ
//�ƶ����

  LPNET_DVR_MOTION = ^NET_DVR_MOTION;
  NET_DVR_MOTION = record
    byMotionScope: array[0..17, 0..21] of BYTE; //*�������,����22*18��С���,Ϊ1��ʾ�ú�����ƶ��������,0-��ʾ����*/
    byMotionSensitive: BYTE; //*�ƶ����������, 0 - 5,Խ��Խ����,$ff�ر�*/
    byEnableHandleMotion: BYTE; //* �Ƿ����ƶ���� */
    strMotionHandleType: NET_DVR_HANDLEEXCEPTION; //* ����ʽ */
    struAlarmTime: array[0..MAX_DAYS - 1, 0..MAX_TIMESEGMENT - 1] of NET_DVR_SCHEDTIME; //����ʱ��
    byRelRecordChan: array[0..MAX_CHANNUM - 1] of BYTE; //����������¼��ͨ��,Ϊ1��ʾ������ͨ��
  end;

  //�ڵ���������Ϊ704*576

  LPNET_DVR_HIDEALARM = ^NET_DVR_HIDEALARM;
  NET_DVR_HIDEALARM = record
    dwEnableHideAlarm: DWORD; //* �Ƿ������ڵ����� ,0-��,1-�������� 2-�������� 3-�������� */
    wHideAlarmAreaTopLeftX: WORD; //* �ڵ������x���� */
    wHideAlarmAreaTopLeftY: WORD; //* �ڵ������y���� */
    wHideAlarmAreaWidth: WORD; //* �ڵ�����Ŀ� */
    wHideAlarmAreaHeight: WORD; //*�ڵ�����ĸ�*/
    strHideAlarmHandleType: NET_DVR_HANDLEEXCEPTION; //* ����ʽ */
    struAlarmTime: array[0..MAX_DAYS - 1, 0..MAX_TIMESEGMENT - 1] of NET_DVR_SCHEDTIME; //����ʱ��
  end;

//�źŶ�ʧ����
  LPNET_DVR_VILOST = ^NET_DVR_VILOST;
  NET_DVR_VILOST = record
    byEnableHandleVILost: BYTE; //* �Ƿ����źŶ�ʧ���� */
    strVILostHandleType: NET_DVR_HANDLEEXCEPTION; //* ����ʽ */
    struAlarmTime: array[0..MAX_DAYS - 1, 0..MAX_TIMESEGMENT - 1] of NET_DVR_SCHEDTIME; //����ʱ��
  end;


  LPNET_DVR_PICCFG = ^NET_DVR_PICCFG;
  NET_DVR_PICCFG = record
    dwSize: DWORD;
    sChanName: array[0..NAME_LEN - 1] of BYTE;
    dwVideoFormat: DWORD; //* ֻ������Ƶ��ʽ 1-NTSC 2-PAL*/
    byBrightness: BYTE; //*����,0-255*/
    byContrast: BYTE; //*�Աȶ�,0-255*/
    bySaturation: BYTE; //*���Ͷ�,0-255 */
    byHue: BYTE; //*ɫ��,0-255*/
 //��ʾͨ����
    dwShowChanName: DWord; //* Ԥ����ͼ�����Ƿ���ʾͨ������,0-����ʾ,1-��ʾ ����Ϊ704*576 */
    wShowNameTopLeftX: Word; //* ͨ��������ʾλ�õ�x���� */
    wShowNameTopLeftY: Word; //* ͨ��������ʾλ�õ�y���� */
 //�źŶ�ʧ����
    struVILost: NET_DVR_VILOST;
 //�ƶ����
    struMotion: NET_DVR_MOTION;
 //�ڵ�����
    struHideAlarm: NET_DVR_HIDEALARM;
 //�ڵ�
    dwEnableHide: DWORD; //* �Ƿ������ڵ� ,0-��,1-�� ����Ϊ704*576*/
    wHideAreaTopLeftX: WORD; //* �ڵ������x���� */
    wHideAreaTopLeftY: WORD; //* �ڵ������y���� */
    wHideAreaWidth: WORD; //* �ڵ�����Ŀ� */
    wHideAreaHeight: WORD; //*�ڵ�����ĸ�*/
 //OSD
    dwShowOsd: DWORD; //* Ԥ����ͼ�����Ƿ���ʾOSD,0-����ʾ,1-��ʾ*/
    wOSDTopLeftX: WORD; //* OSD��x���� */
    wOSDTopLeftY: WORD; //* OSD��y���� */
    byOSDType: BYTE; //* OSD����(��Ҫ�������ո�ʽ) */
       //* 0: XXXX-XX-XX ������ */
       //* 1: XX-XX-XXXX ������ */
       //* 2: XXXX��XX��XX�� */
       //* 3: XX��XX��XXXX�� */
       //* 4: XX-XX-XXXX ������*/
       //* 5: XX��XX��XXXX�� */

    byDispWeek: BYTE; //* �Ƿ���ʾ���� */
    byOSDAttrib: BYTE; //* OSD����:͸������˸ */
         //* 1: ͸��,��˸ */
         //* 2: ͸��,����˸ */
         //* 3: ��˸,��͸�� */
         //* 4: ��͸��,����˸ */
  end;

  LPNET_DVR_SHELTER = ^NET_DVR_SHELTER;
  NET_DVR_SHELTER = record
    wHideAreaTopLeftX: WORD; //* �ڵ������x���� */
    wHideAreaTopLeftY: WORD; //* �ڵ������y���� */
    wHideAreaWidth: WORD; //* �ڵ�����Ŀ� */
    wHideAreaHeight: WORD; //*�ڵ�����ĸ�*/
  end;

//SDK_V14

  LPNET_DVR_PICCFG_EX = ^NET_DVR_PICCFG_EX;
  NET_DVR_PICCFG_EX = record
    dwSize: DWORD;
    sChanName: array[0..NAME_LEN - 1] of BYTE;
    dwVideoFormat: DWORD; //* ֻ�� ��Ƶ��ʽ 1-NTSC 2-PAL*/
    byBrightness: BYTE; //*����,0-255*/
    byContrast: BYTE; //*�Աȶ�,0-255*/
    bySaturation: BYTE; //*���Ͷ�,0-255 */
    byHue: BYTE; //*ɫ��,0-255*/
 //��ʾͨ����
    dwShowChanName: DWORD; // Ԥ����ͼ�����Ƿ���ʾͨ������,0-����ʾ,1-��ʾ �����С704*576
    wShowNameTopLeftX: WORD; //* ͨ��������ʾλ�õ�x���� */
    wShowNameTopLeftY: WORD; //* ͨ��������ʾλ�õ�y���� */
 //�źŶ�ʧ����
    struVILost: NET_DVR_VILOST;
 //�ƶ����
    struMotion: NET_DVR_MOTION;
 //�ڵ�����
    struHideAlarm: NET_DVR_HIDEALARM;
 //�ڵ�  �����С704*576
    dwEnableHide: DWORD; //* �Ƿ������ڵ� ,0-��,1-��*/
    struShelter: array[0..MAX_SHELTERNUM - 1] of NET_DVR_SHELTER;
 //OSD
    dwShowOsd: DWORD; // Ԥ����ͼ�����Ƿ���ʾOSD,0-����ʾ,1-��ʾ �����С704*576
    wOSDTopLeftX: WORD; //* OSD��x���� */
    wOSDTopLeftY: WORD; //* OSD��y���� */
    byOSDType: BYTE; //* OSD����(��Ҫ�������ո�ʽ) */
 //* 0: XXXX-XX-XX ������ */
 //* 1: XX-XX-XXXX ������ */
 //* 2: XXXX��XX��XX�� */
 //* 3: XX��XX��XXXX�� */
    byDispWeek: BYTE; //* �Ƿ���ʾ���� */
    byOSDAttrib: BYTE; //* OSD����:͸������˸ */
 //* 1: ͸��,��˸ */
 //* 2: ͸��,����˸ */
 //* 3: ��˸,��͸�� */
 //* 4: ��͸��,����˸ */
  end;

//ѹ������

  LPNET_DVR_COMPRESSION_INFO = ^NET_DVR_COMPRESSION_INFO;
  NET_DVR_COMPRESSION_INFO = record
    byStreamType: BYTE; //��������0-��Ƶ��,1-������
    byResolution: BYTE; //�ֱ���0-DCIF 1-CIF, 2-QCIF, 3-4CIF, 4-2CIF
    byBitrateType: BYTE; //��������0:�����ʣ�1:������
    byPicQuality: BYTE; //ͼ������ 0-��� 1-�κ� 2-�Ϻ� 3-һ�� 4-�ϲ� 5-��
    dwVideoBitrate: DWORD; //��Ƶ���� 0-���� 1-���� 2-32K 3-48k 4-64K 5-80K 6-96K 7-128K 8-160k 9-192K 10-224K 11-256K 12-320K
    // 13-384K 14-448K 15-512K 16-640K 17-768K 18-896K 19-1024K 20-1280K 21-1536K 22-1792K 23-2048K
    //���λ(31λ)�ó�1��ʾ���Զ�������, 0-30λ��ʾ����ֵ(MIN-16K MAX-8192K)��
    dwVideoFrameRate: DWORD; //֡�� 0-ȫ��; 1-1/16; 2-1/8; 3-1/4; 4-1/2; 5-1; 6-2; 7-4; 8-6; 9-8; 10-10; 11-12; 12-16; 13-20;
  end;

  LPNET_DVR_COMPRESSION_INFO_EX = ^NET_DVR_COMPRESSION_INFO_EX;
  NET_DVR_COMPRESSION_INFO_EX = record
    byStreamType: BYTE; //��������0-��Ƶ��,1-������
    byResolution: BYTE; //�ֱ���0-DCIF 1-CIF, 2-QCIF, 3-4CIF, 4-2CIF
    byBitrateType: BYTE; //��������0:�����ʣ�1:������
    byPicQuality: BYTE; //ͼ������ 0-��� 1-�κ� 2-�Ϻ� 3-һ�� 4-�ϲ� 5-��
    dwVideoBitrate: DWORD; //��Ƶ���� 0-���� 1-16K(����) 2-32K 3-48k 4-64K 5-80K 6-96K 7-128K 8-160k 9-192K 10-224K 11-256K 12-320K
 // 13-384K 14-448K 15-512K 16-640K 17-768K 18-896K 19-1024K 20-1280K 21-1536K 22-1792K 23-2048K
 //���λ(31λ)�ó�1��ʾ���Զ�������, 0-30λ��ʾ����ֵ(MIN-32K MAX-8192K)��
    dwVideoFrameRate: DWORD; //֡�� 0-ȫ��; 1-1/16; 2-1/8; 3-1/4; 4-1/2; 5-1; 6-2; 7-4; 8-6; 9-8; 10-10; 11-12; 12-16; 13-20; //V2.0���� 14-15; 15-18; 16-22;
    wIntervalFrameI: WORD; //I֡���
 //2006-08-11 ���ӵ�P֡�����ýӿڣ����Ը���ʵʱ����ʱ����
    byIntervalBPFrame: BYTE; //0-BBP֡; 1-BP֡; 2-��P֡ BP֡�����ݲ�֧��
    byRes: BYTE;
  end;

  LPNET_DVR_COMPRESSIONCFG = ^NET_DVR_COMPRESSIONCFG;
  NET_DVR_COMPRESSIONCFG = record
    dwSize: DWORD;
    struRecordPara: NET_DVR_COMPRESSION_INFO; //¼��
    struNetPara: NET_DVR_COMPRESSION_INFO; //����
  end;

  LPNET_DVR_COMPRESSIONCFG_EX = ^NET_DVR_COMPRESSIONCFG_EX;
  NET_DVR_COMPRESSIONCFG_EX = record
    dwSize: DWORD;
    struRecordPara: NET_DVR_COMPRESSION_INFO_EX; //¼��
    struNetPara: NET_DVR_COMPRESSION_INFO_EX; //����
  end;

//¼��
  LPNET_DVR_RECORDSCHED = ^NET_DVR_RECORDSCHED;
  NET_DVR_RECORDSCHED = record
    struRecordTime: NET_DVR_SCHEDTIME;
    byRecordType: BYTE; //0:��ʱ¼��1:�ƶ���⣬2:����¼��3:����|������4:����&����, 5:�����, 6: �ֶ�¼��
    reservedData: array[0..2] of char;
  end;

  LPNET_DVR_RECORDDAY = ^NET_DVR_RECORDDAY;
  NET_DVR_RECORDDAY = record
    wAllDayRecord: WORD; //* �Ƿ�ȫ��¼�� */
    byRecordType: BYTE; //* ¼������ 0:��ʱ¼��1:�ƶ���⣬2:����¼��3:����|������4:����&���� 5:�����, 6: �ֶ�¼��*/
    reservedData: char;
  end;

  LPNET_DVR_RECORD = ^NET_DVR_RECORD;
  NET_DVR_RECORD = record
    dwSize: DWORD;
    dwRecord: DWORD; //*�Ƿ�¼�� 0-�� 1-��*/
    struRecAllDay: array[0..MAX_DAYS - 1] of NET_DVR_RECORDDAY;
    struRecordSched: array[0..MAX_DAYS - 1, 0..MAX_TIMESEGMENT - 1] of NET_DVR_RECORDSCHED;
    dwRecordTime: DWORD; //* ¼��ʱ�䳤�� */
    dwPreRecordTime: DWORD; //* Ԥ¼ʱ�� 0-��Ԥ¼ 1-5�� 2-10�� 3-15�� 4-20�� 5-25�� 6-30�� 7-$ffffffff(������Ԥ¼) */
  end;

  LPNET_DVR_FILECOND = ^NET_DVR_FILECOND;
  NET_DVR_FILECOND = record
    lChannel: LONG;
    dwFileType: DWORD;
    dwIsLocked: DWORD;
    dwUseCardNo: DWORD;
    sCardNumber: array[0..31] of Byte;
    struStartTime: NET_DVR_TIME;
    struStopTime: NET_DVR_TIME;
  end;



const
//* PTZ type */
  YOULI = 0;
  LILIN_1016 = 1;
  LILIN_820 = 2;
  PELCO_P = 3;
  DM_QUICKBALL = 4;
  HD600 = 5;
  JC4116 = 6;
  PELCO_DWX = 7;
  PELCO_D = 8;
  VCOM_VC_2000 = 9;
  NETSTREAMER = 10;
  SAE = 11;
  SAMSUNG = 12;
  KALATEL_KTD_312 = 13;
  CELOTEX = 14;
  TLPELCO_P = 15;
  TL_HHX2000 = 16;
  BBV = 17;
  RM110 = 18;
  KC3360S = 19;
  ACES = 20;
  ALSON = 21;
  INV3609HD = 22;
  HOWELL = 23;
  TC_PELCO_P = 24;
  TC_PELCO_D = 25;
  AUTO_M = 26;
  AUTO_H = 27;
  ANTEN = 28;
  CHANGLIN = 29;
  DELTADOME = 30;
  XYM_12 = 31;
  ADR8060 = 32;
  EVI = 33;
  Demo_Speed = 34;
  DM_PELCO_D = 35;
  ST_832 = 36;
  LC_D2104 = 37;
  HUNTER = 38;
  A01 = 39;
  TECHWIN = 40;
  WEIHAN = 41;
  LG = 42;
  D_MAX = 43;
  PANASONIC = 44;
  KTD_348 = 45;
  INFINOVA = 46;
  LILIN = 47;
  IDOME_IVIEW_LCU = 48;
  DENNARD_DOME = 49;
  PHLIPS = 50;
  SAMPLE = 51;
  PLD = 52;
  PARCO = 53;
  HY = 54;
  NAIJIE = 55;
  CAT_KING = 56;
  YH_06 = 57;
  SP9096X = 58;
  M_PANEL = 59;
  M_MV2050 = 60;
  SAE_QUICKBALL = 61;
  RED_APPLE = 62;
  NKO8G = 63;
  DAHUA = 64;
  TX_CONTROL_232 = 65;
  VCL_SPEED_DOME = 66;
  ST_2C160 = 67;
  TIANDI = 68;
  TWHC = 69;
  USNT = 70;
  KALLATE_NVD2200PS = 71;


type
//������
  LPNET_DVR_DECODERCFG = ^NET_DVR_DECODERCFG;
  NET_DVR_DECODERCFG = record
    dwSize: DWORD;
    dwBaudRate: DWORD; //������(bps)��0��50��1��75��2��110��3��150��4��300��5��600��6��1200��7��2400��8��4800��9��9600��10��19200�� 11��38400��12��57600��13��76800��14��115.2k;
    byDataBit: BYTE; // �����м�λ 0��5λ��1��6λ��2��7λ��3��8λ;
    byStopBit: BYTE; // ֹͣλ 0��1λ��1��2λ;
    byParity: BYTE; // У�� 0����У�飬1����У�飬2��żУ��;
    byFlowcontrol: BYTE; // 0���ޣ�1��������,2-Ӳ����
    wDecoderType: WORD; //����������, 0��YouLi��1��LiLin-1016��2��LiLin-820��3��Pelco-p��4��DM DynaColor��5��HD600��6��JC-4116��7��Pelco-d WX��8��Pelco-d PICO
    wDecoderAddress: WORD; //*��������ַ:0 - 255*/
    bySetPreset: array[0..MAX_PRESET - 1] of byte; //* Ԥ�õ��Ƿ�����,0-û������,1-����*/
    bySetCruise: array[0..MAX_PRESET - 1] of byte; //* Ѳ���Ƿ�����: 0-û������,1-���� */
    bySetTrack: array[0..MAX_PRESET - 1] of byte; //* �켣�Ƿ�����,0-û������,1-����*/
  end;

//RS232����
  LPNET_DVR_PPPCFG = ^NET_DVR_PPPCFG;
  NET_DVR_PPPCFG = record
    sRemoteIP: char_16; //Զ��IP��ַ
    sLocalIP: char_16; //����IP��ַ
    sLocalIPMask: char_16; //����IP��ַ����
    sUsername: array[0..NAME_LEN - 1] of BYTE; //* �û��� */
    sPassword: array[0..PASSWD_LEN - 1] of BYTE; //* ���� */
    byPPPMode: Byte; //PPPģʽ, 0��������1������
    byRedial: Byte; //�Ƿ�ز� ��0-��,1-��
    byRedialMode: Byte; //�ز�ģʽ,0-�ɲ�����ָ��,1-Ԥ�ûز�����
    byDataEncrypt: Byte; //���ݼ���,0-��,1-��
    dwMTU: DWORD; //MTU
    sTelephoneNumber: array[0..PHONENUMBER_LEN - 1] of char; //�绰����
  end;

  LPNET_DVR_RS232CFG = ^NET_DVR_RS232CFG;
  NET_DVR_RS232CFG = record
    dwSize: DWORD;
    dwBaudRate: DWORD; //������(bps)��0��50��1��75��2��110��3��150��4��300��5��600��6��1200��7��2400��8��4800��9��9600��10��19200�� 11��38400��12��57600��13��76800��14��115.2k;
    byDataBit: BYTE; // �����м�λ 0��5λ��1��6λ��2��7λ��3��8λ;
    byStopBit: BYTE; // ֹͣλ 0��1λ��1��2λ;
    byParity: BYTE; // У�� 0����У�飬1����У�飬2��żУ��;
    byFlowcontrol: BYTE; // 0���ޣ�1��������,2-Ӳ����
    dwWorkMode: DWORD; // ����ģʽ��0��խ������(232��������PPP����)��1������̨(232�������ڲ�������)��2��͸��ͨ��
    struPPPConfig: NET_DVR_PPPCFG;
  end;

//��������

  LPNET_DVR_ALARMINCFG = ^NET_DVR_ALARMINCFG;
  NET_DVR_ALARMINCFG = record
    dwSize: DWORD;
    sAlarmInName: array[0..NAME_LEN - 1] of BYTE; //* ���� */
    byAlarmType: BYTE; //����������,0������,1������
    byAlarmInHandle: BYTE; //* �Ƿ��� */
    struAlarmHandleType: NET_DVR_HANDLEEXCEPTION; //* ����ʽ */
    struAlarmTime: array[0..MAX_DAYS - 1, 0..MAX_TIMESEGMENT - 1] of NET_DVR_SCHEDTIME; //����ʱ��
    byRelRecordChan: array[0..MAX_CHANNUM - 1] of BYTE; //����������¼��ͨ��,Ϊ1��ʾ������ͨ��
    byEnablePreset: array[0..MAX_CHANNUM - 1] of BYTE; //* �Ƿ����Ԥ�õ� */
    byPresetNo: array[0..MAX_CHANNUM - 1] of BYTE; //* ���õ���̨Ԥ�õ����,һ������������Ե��ö��ͨ������̨Ԥ�õ�, $ff��ʾ������Ԥ�õ㡣*/
    byEnableCruise: array[0..MAX_CHANNUM - 1] of BYTE; //* �Ƿ����Ѳ�� */
    byCruiseNo: array[0..MAX_CHANNUM - 1] of BYTE; //* Ѳ�� */
    byEnablePtzTrack: array[0..MAX_CHANNUM - 1] of BYTE; //* �Ƿ���ù켣 */
    byPTZTrack: array[0..MAX_CHANNUM - 1] of BYTE; //* ���õ���̨�Ĺ켣��� */
  end;


//�ϴ�������Ϣ
  LPNET_DVR_ALARMINFO = ^NET_DVR_ALARMINFO;
  NET_DVR_ALARMINFO = record
    dwAlarmType: DWORD; //*0-�ź�������,1-Ӳ����,2-�źŶ�ʧ��3���ƶ���⣬4��Ӳ��δ��ʽ��,5-��дӲ�̳���,6-�ڵ�����,7-��ʽ��ƥ��, 8-�Ƿ�����*/
    dwAlarmInputNumber: DWORD; //*��������˿�*/
    dwAlarmOutputNumber: array[0..MAX_ALARMOUT - 1] of DWORD; //*��������˿ڶ�Ӧ������˿ڣ���һλΪ1��ʾ��Ӧ��һ�����*/
    dwAlarmRelateChannel: array[0..MAX_CHANNUM - 1] of DWORD; //*��������˿ڶ�Ӧ��¼��ͨ������һλΪ1��ʾ��Ӧ��һ·¼��,dwAlarmRelateChannel[0]��Ӧ��1��ͨ��*/
    dwChannel: array[0..MAX_CHANNUM - 1] of DWORD; //*dwAlarmTypeΪ2��3ʱ����ʾ�ĸ�ͨ����dwChannel[0]λ��Ӧ��0��ͨ��*/
    dwDiskNumber: array[0..MAX_DISKNUM - 1] of DWORD; //*dwAlarmTypeΪ4ʱ,��ʾ�ĸ�Ӳ��*/
  end;


//DVR�������
  LPNET_DVR_ALARMOUTCFG = ^NET_DVR_ALARMOUTCFG;
  NET_DVR_ALARMOUTCFG = record
    dwSize: DWORD;
    sAlarmOutName: array[0..NAME_LEN - 1] of BYTE; //* ���� */
    dwAlarmOutDelay: DWORD; //* �������ʱ��(-1Ϊ���ޣ��ֶ��ر�) */
    struAlarmOutTime: array[0..MAX_DAYS - 1, 0..MAX_TIMESEGMENT - 1] of NET_DVR_SCHEDTIME; //* �����������ʱ��� */
  end;

//DVR����Ԥ������
  LPNET_DVR_PREVIEWCFG = ^NET_DVR_PREVIEWCFG;
  NET_DVR_PREVIEWCFG = record
    dwSize: DWORD;
    byPreviewNumber: BYTE; //Ԥ����Ŀ,0-1����,1-4����,2-9����,3-16����,$ff:�����
    byEnableAudio: BYTE; //�Ƿ�����Ԥ��,0-��Ԥ��,1-Ԥ��
    wSwitchTime: WORD; //�л�ʱ��,0-���л�,1-5s,2-10s,3-20s,4-60s,5-120s,6-300s
    bySwitchSeq: array[0..MAX_WINDOW - 1] of BYTE; //�л�˳��,���lSwitchSeq[i]Ϊ $ff��ʾ����
  end;

//DVR��Ƶ���
  LPNET_DVR_VGAPARA = ^NET_DVR_VGAPARA;
  NET_DVR_VGAPARA = record
    wResolution: WORD; //* �ֱ��� */
    wFreq: WORD; //* ˢ��Ƶ�� */
    dwBrightness: DWORD; //* ���� */
  end;


  PNET_DVR_MATRIXPARA = ^NET_DVR_MATRIXPARA;
  NET_DVR_MATRIXPARA = record
    wDisplayLogo: WORD; //* ��ʾ��Ƶͨ���� */
    wDisplayOsd: WORD; //* ��ʾʱ�� */
  end;

  LPNET_DVR_VOOUT = ^NET_DVR_VOOUT;
  NET_DVR_VOOUT = record
    byVideoFormat: BYTE; //* �����ʽ,0-PAL,1-N	*/
    byMenuAlphaValue: BYTE; //* �˵��뱳��ͼ��Աȶ� */
    wScreenSaveTime: WORD; //* ��Ļ����ʱ�� */
    wVOffset: WORD; //* ��Ƶ���ƫ�� */
    wBrightness: WORD; //* ��Ƶ������� */
    byStartMode: BYTE; //* ��������Ƶ���ģʽ(0:�˵�,1:Ԥ��)*/
    reservedData: char;
  end;

  LPNET_DVR_VIDEOOUT = ^NET_DVR_VIDEOOUT;
  NET_DVR_VIDEOOUT = record
    dwSize: DWORD;
    struVOOut: array[0..MAX_VIDEOOUT - 1] of NET_DVR_VOOUT;
    struVGAPara: array[0..MAX_VGA - 1] of NET_DVR_VGAPARA; //* VGA���� */
    struMatrixPara: NET_DVR_MATRIXPARA; //* MATRIX���� */
  end;

//DVR�û�����
  LPNET_DVR_USER_INFO = ^NET_DVR_USER_INFO;
  NET_DVR_USER_INFO = record
    sUserName: array[0..NAME_LEN - 1] of BYTE; //* �û��� */
    sPassword: array[0..PASSWD_LEN - 1] of BYTE; //* ���� */
    dwLocalRight: array[0..MAX_RIGHT - 1] of DWORD; //* Ȩ�� */
  //*����0: ���ؿ�����̨*/
  //*����1: �����ֶ�¼��*/
  //*����2: ���ػط�*/
  //*����3: �������ò���*/
  //*����4: ���ز鿴״̬����־*/
  //*����5: ���ظ߼�����(��������ʽ�����������ػ�)*/
    dwRemoteRight: array[0..MAX_RIGHT - 1] of DWORD; //* Ȩ�� */
    //*����0: Զ�̿�����̨*/
   //*����1: Զ���ֶ�¼��*/
  //*����2: Զ�̻ط�*/
  //*����3: Զ�����ò���*/
  //*����4: Զ�̲鿴״̬����־*/
  //*����5: Զ�̸߼�����(��������ʽ�����������ػ�)*/
  //*����6: Զ�̷��������Խ�*/
  //*����7: Զ��Ԥ��*/
  //*����8: Զ�����󱨾��ϴ����������*/
  //*����9: Զ�̿��ƣ��������*/
  //*����10: Զ�̿��ƴ���*/
    sUserIP: char_16; //* �û�IP��ַ(Ϊ0ʱ��ʾ�����κε�ַ) */
    byMACAddr: array[0..MACADDR_LEN - 1] of BYTE; //* �����ַ */
  end;

  LPNET_DVR_USER = ^NET_DVR_USER;
  NET_DVR_USER = record
    dwSize: DWORD;
    struUser: array[0..MAX_USERNUM - 1] of NET_DVR_USER_INFO;
  end;

  //DVR�û�������չ
  LPNET_DVR_USER_INFO_EX = ^NET_DVR_USER_INFO_EX;
  NET_DVR_USER_INFO_EX = record
    sUserName: array[0..NAME_LEN - 1] of BYTE; //* �û��� */
    sPassword: array[0..PASSWD_LEN - 1] of BYTE; //* ���� */
    dwLocalRight: array[0..MAX_RIGHT - 1] of DWORD; //* Ȩ�� */
 //*����0: ���ؿ�����̨*/
 //*����1: �����ֶ�¼��*/
 //*����2: ���ػط�*/
 //*����3: �������ò���*/
 //*����4: ���ز鿴״̬����־*/
 //*����5: ���ظ߼�����(��������ʽ�����������ػ�)*/
    dwLocalPlaybackRight: DWORD; //* ���ؿ��Իطŵ�ͨ�� bit0 -- channel 1*/
    dwRemoteRight: array[0..MAX_RIGHT - 1] of DWORD; //* Ȩ�� */
 //*����0: Զ�̿�����̨*/
 //*����1: Զ���ֶ�¼��*/
 //*����2: Զ�̻ط� */
 //*����3: Զ�����ò���*/
 //*����4: Զ�̲鿴״̬����־*/
 //*����5: Զ�̸߼�����(��������ʽ�����������ػ�)*/
 //*����6: Զ�̷��������Խ�*/
 //*����7: Զ��Ԥ��*/
 //*����8: Զ�����󱨾��ϴ����������*/
 //*����9: Զ�̿��ƣ��������*/
 //*����10: Զ�̿��ƴ���*/
    dwNetPreviewRight: DWORD; //* Զ�̿���Ԥ����ͨ�� bit0 -- channel 1*/
    dwNetPlaybackRight: DWORD; //* Զ�̿��Իطŵ�ͨ�� bit0 -- channel 1*/
    sUserIP: char_16; //* �û�IP��ַ(Ϊ0ʱ��ʾ�����κε�ַ) */
    byMACAddr: array[0..MACADDR_LEN - 1] of BYTE; //* �����ַ */
  end;

  LPNET_DVR_USER_EX = ^NET_DVR_USER_EX;
  NET_DVR_USER_EX = record
    dwSize: DWORD;
    struUser: array[0..MAX_USERNUM] of NET_DVR_USER_INFO_EX;
  end;

//DVR�쳣����
  LPNET_DVR_EXCEPTION = ^NET_DVR_EXCEPTION;
  NET_DVR_EXCEPTION = record
    dwSize: DWORD;
    struExceptionHandleType: array[0..MAX_EXCEPTIONNUM - 1] of NET_DVR_HANDLEEXCEPTION;
 //*����0-����,1- Ӳ�̳���,2-���߶�,3-��������IP ��ַ��ͻ,4-�Ƿ�����, 5-����/�����Ƶ��ʽ��ƥ��*/
  end;

  LPNET_DVR_FIND_DATA = ^NET_DVR_FIND_DATA;
  NET_DVR_FIND_DATA = record
    sFileName: array[0..99] of char; //�ļ���
    struStartTime: NET_DVR_TIME; //�ļ��Ŀ�ʼʱ��
    struStopTime: NET_DVR_TIME; //�ļ��Ľ���ʱ��
    dwFileSize: DWORD; //�ļ��Ĵ�С
  end;

  LPNET_DVR_FINDDATA_V30 = ^NET_DVR_FINDDATA_V30;
  NET_DVR_FINDDATA_V30 = record
    sFileName: array[0..99] of char; //�ļ���
    struStartTime: NET_DVR_TIME; //�ļ��Ŀ�ʼʱ��
    struStopTime: NET_DVR_TIME; //�ļ��Ľ���ʱ��
    dwFileSize: DWORD;
    sCardNum: array[0..31] of Char;
    byLocked: Byte;
    byRes: array[0..2] of Byte;
  end;


  LPNET_DVR_CHANNELSTATE = ^NET_DVR_CHANNELSTATE;
  NET_DVR_CHANNELSTATE = record
    byRecordStatic: BYTE; //ͨ���Ƿ���¼��,0-��¼��,1-¼��
    bySignalStatic: BYTE; //���ӵ��ź�״̬,0-����,1-�źŶ�ʧ
    byHardwareStatic: BYTE; //ͨ��Ӳ��״̬,0-����,1-�쳣,����DSP����
    reservedData: char;
    dwBitRate: DWORD; //ʵ������
    dwLinkNum: DWORD; //�ͻ������ӵĸ���
    dwClientIP: array[0..MAX_LINK - 1] of DWORD; //�ͻ��˵�IP��ַ
  end;

  LPNET_DVR_DISKSTATE = ^NET_DVR_DISKSTATE;
  NET_DVR_DISKSTATE = record
    dwVolume: DWORD; //Ӳ�̵�����
    dwFreeSpace: DWORD; //Ӳ�̵�ʣ��ռ�
    dwHardDiskStatic: DWORD; //Ӳ�̵�״̬,����,�,��������
  end;

  NET_DVR_IPADDR=record
   sIpV4:array[0..16-1] of char;
   sIpV6:array[0..128-1] of BYTE;
  end;
  


  NET_DVR_CHANNELSTATE_V30=record
  byRecordStatic:BYTE;
  bySignalStatic:BYTE;
  byHardwareStatic:BYTE;
  byRes1:BYTE;
  dwBitRate:DWORD;
  dwLinkNum:DWORD;
  struClientIP:array[0..MAX_LINK-1] of NET_DVR_IPADDR;
  dwIPLinkNum:DWORD;
  byRes:array[0..12-1] of BYTE;
  end;

  LPNET_DVR_WORKSTATE = ^NET_DVR_WORKSTATE;
  NET_DVR_WORKSTATE = record
    dwDeviceStatic: DWORD; //�豸��״̬,0-����,1-CPUռ����̫��,����85%,2-Ӳ������,���紮������
    struHardDiskStatic: array[0..MAX_DISKNUM - 1] of NET_DVR_DISKSTATE;
    struChanStatic: array[0..MAX_CHANNUM - 1] of NET_DVR_CHANNELSTATE; //ͨ����״̬
    byAlarmInStatic: array[0..MAX_ALARMIN - 1] of BYTE; //�����˿ڵ�״̬,0-û�б���,1-�б���
    byAlarmOutStatic: array[0..MAX_ALARMOUT - 1] of BYTE; //��������˿ڵ�״̬,0-û�����,1-�б������
    dwLocalDisplay: DWORD; //������ʾ״̬,0-����,1-������
  end;

  LPNET_DVR_WORKSTATE_V30 = ^NET_DVR_WORKSTATE_V30;
  NET_DVR_WORKSTATE_V30=record
  dwDeviceStatic:DWORD;
  struHardDiskStatic:array[0..MAX_DISKNUM_V30-1] of NET_DVR_DISKSTATE;
  struChanStatic:array[0..MAX_CHANNUM_V30-1] of NET_DVR_CHANNELSTATE_V30;
  byAlarmInStatic:array[0..MAX_ALARMIN_V30-1] of BYTE;
  byAlarmOutStatic:array[0..MAX_ALARMOUT_V30-1] of BYTE;
  dwLocalDisplay:DWORD;
  byAudioChanStatus:array[0..MAX_AUDIO_V30-1] of BYTE;
  byRes:array[0..10-1] of BYTE;
 end;

const
//DVR��־
//* ���� */
//������
  MAJOR_ALARM = $1;
//������
  MINOR_ALARM_IN = $1; //* �������� */
  MINOR_ALARM_OUT = $2; //* ������� */
  MINOR_MOTDET_START = $3; //* �ƶ���ⱨ����ʼ */
  MINOR_MOTDET_STOP = $4; //* �ƶ���ⱨ������ */
  MINOR_HIDE_ALARM_START = $5; //* �ڵ�������ʼ */
  MINOR_HIDE_ALARM_STOP = $6; //* �ڵ��������� */

//* �쳣 */
//������
  MAJOR_EXCEPTION = $2;
//������
  MINOR_VI_LOST = $21; //* �źŶ�ʧ */
  MINOR_ILLEGAL_ACCESS = $22; //* �Ƿ����� */
  MINOR_HD_FULL = $23; //* Ӳ���� */
  MINOR_HD_ERROR = $24; //* Ӳ�̴��� */
  MINOR_DCD_LOST = $25; //* MODEM ���� */
  MINOR_IP_CONFLICT = $26; //* IP��ַ��ͻ */
  MINOR_NET_BROKEN = $27; //* ���߶� */

//* ���� */
//������
  MAJOR_OPERATION = $3;
//������
  MINOR_START_DVR = $41; //* ���� */
  MINOR_STOP_DVR = $42; //* �ػ� */
  MINOR_STOP_ABNORMAL = $43; //* �Ƿ��ػ� */

  MINOR_LOCAL_LOGIN = $50; //* ���ص�½ */
  MINOR_LOCAL_LOGOUT = $51; //* ����ע����½ */
  MINOR_LOCAL_CFG_PARM = $52; //* �������ò��� */
  MINOR_LOCAL_PLAYBYFILE = $53; //* ���ذ��ļ��ط� */
  MINOR_LOCAL_PLAYBYTIME = $54; //* ���ذ�ʱ��ط� */
  MINOR_LOCAL_START_REC = $55; //* ���ؿ�ʼ¼�� */
  MINOR_LOCAL_STOP_REC = $56; //* ����ֹͣ¼�� */
  MINOR_LOCAL_PTZCTRL = $57; //* ������̨���� */
  MINOR_LOCAL_PREVIEW = $58; //* ����Ԥ�� */
  MINOR_LOCAL_MODIFY_TIME = $59; //* �����޸�ʱ�� */
  MINOR_LOCAL_UPGRADE = $5A; //* �������� */
  MINOR_LOCAL_COPYFILE = $5B; //* ���ر����ļ� */

  MINOR_REMOTE_LOGIN = $70; //* Զ�̵�¼ */
  MINOR_REMOTE_LOGOUT = $71; //* Զ��ע����½ */
  MINOR_REMOTE_START_REC = $72; //* Զ�̿�ʼ¼�� */
  MINOR_REMOTE_STOP_REC = $73; //* Զ��ֹͣ¼�� */
  MINOR_START_TRANS_CHAN = $74; //* ��ʼ͸������ */
  MINOR_STOP_TRANS_CHAN = $75; //* ֹͣ͸������ */
  MINOR_REMOTE_GET_PARM = $76; //* Զ�̻�ò��� */
  MINOR_REMOTE_CFG_PARM = $77; //* Զ�����ò��� */
  MINOR_REMOTE_GET_STATUS = $78; //* Զ�̻��״̬ */
  MINOR_REMOTE_ARM = $79; //* Զ�̲��� */
  MINOR_REMOTE_DISARM = $7A; //* Զ�̳��� */
  MINOR_REMOTE_REBOOT = $7B; //* Զ������ */
  MINOR_START_VT = $7C; //* ��ʼ�����Խ� */
  MINOR_STOP_VT = $7D; //* ֹͣ�����Խ� */
  MINOR_REMOTE_UPGRADE = $7E; //* Զ������ */
  MINOR_REMOTE_PLAYBYFILE = $7F; //* Զ�̰��ļ��ط� */
  MINOR_REMOTE_PLAYBYTIME = $80; //* Զ�̰�ʱ��ط� */
  MINOR_REMOTE_PTZCTRL = $81; //* Զ����̨���� */

type
  LPNET_DVR_LOG = ^NET_DVR_LOG;
  NET_DVR_LOG = record
    strLogTime: NET_DVR_TIME;
    dwMajorType: DWORD; //������ 1-����; 2-�쳣; 3-����; $ff-ȫ��
    dwMinorType: DWORD; //������ $ff-ȫ��;
    sPanelUser: array[0..MAX_NAMELEN - 1] of BYTE; //���������û���
    sNetUser: array[0..MAX_NAMELEN - 1] of BYTE; //����������û���
    sRemoteHostAddr: char_16; //Զ��������ַ
    dwParaType: DWORD; //��������
    dwChannel: DWORD; //ͨ����
    dwDiskNumber: DWORD; //Ӳ�̺�
    dwAlarmInPort: DWORD; //��������˿�
    dwAlarmOutPort: DWORD; //��������˿�
  end;

  LPNET_DVR_REDIRECTORINFO = ^NET_DVR_REDIRECTORINFO;
  NET_DVR_REDIRECTORINFO = record
    sRedirectorIP: char_16; // ת��������IP��ַ
    wRedirectorPort: WORD; // �˿ں�
  end;

  LPNET_DVR_ALARMOUTSTATUS = ^NET_DVR_ALARMOUTSTATUS;
  NET_DVR_ALARMOUTSTATUS = record
    Output: array[0..MAX_ALARMOUT - 1] of BYTE;
  end;

  LPNET_DVR_TRADEINFO = ^NET_DVR_TRADEINFO;
  NET_DVR_TRADEINFO = record
    m_Year: USHORT;
    m_Month: USHORT;
    m_Day: USHORT;
    m_Hour: USHORT;
    m_Minute: USHORT;
    m_Second: USHORT;
    DeviceName: array[0..23] of BYTE; //�豸����
    dwChannelNumer: DWORD; //ͨ����
    CardNumber: array[0..31] of BYTE; //����
    cTradeType: array[0..12] of char; //��������
    dwCash: DWORD; //���׽��
  end;

//����ΪATMר��
//*֡��ʽ*/

  LPNET_DVR_FRAMETYPECODE = ^NET_DVR_FRAMETYPECODE;
  NET_DVR_FRAMETYPECODE = record
    code: array[0..11] of BYTE; //* ���� */
  end;

  LPNET_DVR_FRAMEFORMAT = ^NET_DVR_FRAMEFORMAT;
  NET_DVR_FRAMEFORMAT = record
    dwSize: DWORD;
    sATMIP: char_16; //* ATM IP��ַ */
    dwATMType: DWORD; //* ATM���� */
    dwInputMode: DWORD; //* ���뷽ʽ	*/
    dwFrameSignBeginPos: DWORD; //* ���ı�־λ����ʼλ��*//
    dwFrameSignLength: DWORD; //* ���ı�־λ�ĳ��� */
    byFrameSignContent: array[0..11] of BYTE; //* ���ı�־λ������ */
    dwCardLengthInfoBeginPos: DWORD; //* ���ų�����Ϣ����ʼλ�� */
    dwCardLengthInfoLength: DWORD; //* ���ų�����Ϣ�ĳ��� */
    dwCardNumberInfoBeginPos: DWORD; //* ������Ϣ����ʼλ�� */
    dwCardNumberInfoLength: DWORD; //* ������Ϣ�ĳ��� */
    dwBusinessTypeBeginPos: DWORD; //* �������͵���ʼλ�� */
    dwBusinessTypeLength: DWORD; //* �������͵ĳ��� */
    frameTypeCode: array[0..9] of NET_DVR_FRAMETYPECODE; //* ���� */
  end;


const

//DS-6001D/F
//*�����豸�����붨��*/
  NET_DEC_STARTDEC = 1;
  NET_DEC_STOPDEC = 2;
  NET_DEC_STOPCYCLE = 3;
  NET_DEC_CONTINUECYCLE = 4;

type
  //*���ӵ�ͨ������*/
  LPNET_DVR_DECCHANINFO = ^NET_DVR_DECCHANINFO;
  NET_DVR_DECCHANINFO = record
    sDVRIP: char_16; //* DVR IP��ַ */
    wDVRPort: WORD; //* �˿ں� */
    sUserName: array[0..NAME_LEN - 1] of BYTE; //* �û��� */
    sPassword: array[0..PASSWD_LEN - 1] of BYTE; //* ���� */
    byChannel: BYTE; //* ͨ���� */
    byLinkMode: BYTE; //* ����ģʽ */
    byLinkType: BYTE; //* �������� 0�������� 1�������� */
  end;

  //*ÿ������ͨ��������*/
  LPNET_DVR_DECINFO = ^NET_DVR_DECINFO;
  NET_DVR_DECINFO = record
    byPoolChans: BYTE; //*ÿ·����ͨ���ϵ�ѭ��ͨ������, ���4ͨ��*/
    struchanConInfo: array[0..MAX_DECPOOLNUM - 1] of NET_DVR_DECCHANINFO;
    byEnablePoll: BYTE; //*�Ƿ���Ѳ 0-�� 1-��*/
    byPoolTime: BYTE; //*��Ѳʱ�� 0-���� 1-10�� 2-15�� 3-20�� 4-30�� 5-45�� 6-1���� 7-2���� 8-5���� */
  end;

//*�����豸��������*/
  LPNET_DVR_DECCFG = ^NET_DVR_DECCFG;
  NET_DVR_DECCFG = record
    dwSize: DWORD;
    dwDecChanNum: DWORD; //*����ͨ��������*/
    struDecInfo: array[0..MAX_DECNUM - 1] of NET_DVR_DECINFO;
  end;
//2005-08-01
//* �����豸͸��ͨ������ */
  LPNET_DVR_PORTINFO = ^NET_DVR_PORTINFO;
  NET_DVR_PORTINFO = record
    dwEnableTransPort: DWORD; //* �Ƿ�����͸��ͨ�� 0�������� 1������*/
    sDecoderIP: char_16; //* DVR IP��ַ */
    wDecoderPort: WORD; //* �˿ں� */
    wDVRTransPort: WORD; //* ����ǰ��DVR�Ǵ�485/232�����1��ʾ485����,2��ʾ232���� */
    cReserve: array[0..3] of char;
  end;


  LPNET_DVR_PORTCFG = ^NET_DVR_PORTCFG;
  NET_DVR_PORTCFG = record
    dwSize: DWORD;
    struTransPortInfo: array[0..MAX_TRANSPARENTNUM - 1] of NET_DVR_PORTINFO; //* ����0��ʾ485 ����1��ʾ232 */
  end;

  //* ���������ļ��ط� */
  TBytime = record
    dwChannel: DWORD;
    sUserName: array[0..NAME_LEN - 1] of BYTE; //*������Ƶ�û���*/
    sPassword: array[0..PASSWD_LEN - 1] of BYTE; //* ���� */
    struStartTime: NET_DVR_TIME; //* ��ʱ��طŵĿ�ʼʱ�� */
    struStopTime: NET_DVR_TIME; //* ��ʱ��طŵĽ���ʱ�� */
  end;

  LPNET_DVR_PLAYREMOTEFILE = ^NET_DVR_PLAYREMOTEFILE;
  NET_DVR_PLAYREMOTEFILE = record
    dwSize: DWORD;
    sDecoderIP: char_16; //* DVR IP��ַ */
    wDecoderPort: WORD; //* �˿ں� */
    wLoadMode: WORD; //* �ط�����ģʽ 1�������� 2����ʱ�� */
    case Integer of
      0: (
        byFile: array[0..99] of BYTE; //* �طŵ��ļ��� */
        );
      1: (
        ByTime: TBytime;
        );

  end;

  //*��ǰ�豸��������״̬*/

  TUserInfo = record
    sUserName: array[0..NAME_LEN - 1] of BYTE; //*������Ƶ�û���*/
    sPassword: array[0..PASSWD_LEN - 1] of BYTE; //* ���� */
    cReserve: array[0..51] of char;
  end;
  TfileInfo = record
    fileName: array[0..99] of BYTE;
  end;

  TTimeInfo = record
    dwChannel: DWORD;
    sUserName: array[0..NAME_LEN - 1] of BYTE; //*������Ƶ�û���*/
    sPassword: array[0..PASSWD_LEN - 1] of BYTE; //* ���� */
    struStartTime: NET_DVR_TIME; //* ��ʱ��طŵĿ�ʼʱ�� */
    struStopTime: NET_DVR_TIME; //* ��ʱ��طŵĽ���ʱ�� */
  end;

  LPNET_DVR_DECCHANSTATUS = ^NET_DVR_DECCHANSTATUS;
  NET_DVR_DECCHANSTATUS = record
    dwWorkType: DWORD; //*������ʽ��1����Ѳ��2����̬���ӽ��롢3�����ļ��ط� 4����ʱ��ط�*/
    sDVRIP: char_16; //*���ӵ��豸ip*/
    wDVRPort: WORD; //*���Ӷ˿ں�*/
    byChannel: BYTE; //* ͨ���� */
    byLinkMode: BYTE; //* ����ģʽ */
    dwLinkType: DWORD; //*�������� 0�������� 1��������*/
    case Integer of
      0: (userInfo: TuserInfo); // 100���ֽ�
      1: (fileInfo: TfileInfo);
      2: (timeInfo: TtimeInfo);

  end;

  LPNET_DVR_DECSTATUS = ^NET_DVR_DECSTATUS;
  NET_DVR_DECSTATUS = record
    dwSize: DWORD;
    struDecState: array[0..MAX_DECNUM - 1] of NET_DVR_DECCHANSTATUS;
  end;

  //�����ַ�
  LPNET_DVR_SHOWSTRINGINFO = ^NET_DVR_SHOWSTRINGINFO;
  NET_DVR_SHOWSTRINGINFO = record
    wShowString: WORD; // Ԥ����ͼ�����Ƿ���ʾ�ַ�,0-����ʾ,1-��ʾ �����С704*576,�����ַ��Ĵ�СΪ32*32
    wStringSize: WORD; //* �����ַ��ĳ��ȣ����ܴ���44���ַ� */
    wShowStringTopLeftX: WORD; //* �ַ���ʾλ�õ�x���� */
    wShowStringTopLeftY: WORD; //* �ַ�������ʾλ�õ�y���� */
    sString: array[0..43] of char; //* Ҫ��ʾ���ַ����� */
  end;


  //�����ַ�

  LPNET_DVR_SHOWSTRING = ^NET_DVR_SHOWSTRING;
  NET_DVR_SHOWSTRING = record
    dwSize: DWORD;
    struStringInfo: array[0..MAX_STRINGNUM - 1] of NET_DVR_SHOWSTRINGINFO; //* Ҫ��ʾ���ַ����� */
  end;

  //* ftp �ϴ�����*/

  LPNET_DVR_FTPCFG = ^NET_DVR_FTPCFG;
  NET_DVR_FTPCFG = record
    dwSize: DWORD;
    dwEnableFTP: DWORD; //*�Ƿ�����ftp�ϴ�����*/
    sFTPIP: char_16; //*ftp ������*/
    dwFTPPort: DWORD; //*ftp�˿�*/
    sUserName: array[0..NAME_LEN - 1] of BYTE; //*�û���*/
    sPassword: array[0..PASSWD_LEN - 1] of BYTE; //*����*/
 //BYTE	reservedData[32];
    dwDirLevel: DWORD; //*0 = ��ʹ��Ŀ¼�ṹ��ֱ�ӱ����ڸ�Ŀ¼,1 = ʹ��1��Ŀ¼,2=ʹ��2��Ŀ¼*/
    wTopDirMode: WORD; //* $1 = ʹ���豸��,$2 = ʹ���豸��,$3 = ʹ���豸ip��ַ*/
    wSubDirMode: WORD; //* $4 = ʹ��ͨ����,$5 = ʹ��ͨ����*/
    reservedData: array[0..23] of BYTE;
  end;


const

  //*����������ͼƬ�����Ԫ�� */
  PICNAME_ITEM_DEV_NAME = 1;
  PICNAME_ITEM_DEV_NO = 2;
  PICNAME_ITEM_DEV_IP = 3;
  PICNAME_ITEM_CHAN_NAME = 4;
  PICNAME_ITEM_CHAN_NO = 5;
  PICNAME_ITEM_TIME = 6;
  PICNAME_ITEM_CARDNO = 7;
  PICNAME_MAXITEM = 15;

type

  LPNET_DVR_PICTURE_NAME = ^NET_DVR_PICTURE_NAME;
  NET_DVR_PICTURE_NAME = record
    byItemOrder: array[0..PICNAME_MAXITEM - 1] of BYTE; //*	�����鶨���ļ������Ĺ��� */
    byDelimiter: BYTE; //*�ָ�����һ��Ϊ'_'*/
  end;

  //ͼƬ����

  LPNET_DVR_JPEGPARA = ^NET_DVR_JPEGPARA;
  NET_DVR_JPEGPARA = record
    wPicSize: WORD; //*ͼƬ�ߴ磺0-CIF��1-QCIF��2-D1��3-UXGA��4-SVGA��5-HD720p��6-VGA��7-XVGA��8-HD900p */
    wPicQuality: WORD; //* ͼƬ����ϵ�� 0-��� 1-�Ϻ� 2-һ�� */
  end;

  //* ����ץͼ����*/
  LPNET_DVR_SERIAL_CATCHPIC_PARA = ^NET_DVR_SERIAL_CATCHPIC_PARA;
  NET_DVR_SERIAL_CATCHPIC_PARA = record
    byStrFlag: BYTE; //*�������ݿ�ʼ��*/
    byEndFlag: BYTE; //*������*/
    wCardIdx: WORD; //*���������ʼλ*/
    dwCardLen: DWORD; //*���ų���*/
    dwTriggerPicChans: DWORD; //*��������ͨ���ţ���λ���ӵ�1λ��ʼ�ƣ���$2��ʾ��һͨ��*/
  end;

 // typedef struct tagJPEGCFG
  LPNET_DVR_JPEGCFG = ^NET_DVR_JPEGCFG;
  NET_DVR_JPEGCFG = record
    dwSize: DWORD;
    struJpegPara: array[0..MAX_CHANNUM - 1] of NET_DVR_JPEGPARA; //*ÿ��ͨ����ͼ�����*/
    wBurstMode: WORD; //*ץͼ��ʽ,��λ����.$1=�������봥����$2=�ƶ���ⴥ�� $4=232������$8=485������$10=���紥��*/
    wUploadInterval: WORD; //*ͼƬ�ϴ����(��)[0,65535]*/
    struPicNameRule: NET_DVR_PICTURE_NAME; //* ͼƬ�������� */
    bySaveToHD: BYTE; //*�Ƿ񱣴浽Ӳ��*/
    res1: BYTE;
    wCatchInterval: WORD; //*ץͼ���(����)[0,65535]*/
    res2: array[0..11] of BYTE;
    struRs232Cfg: NET_DVR_SERIAL_CATCHPIC_PARA;
    struRs485Cfg: NET_DVR_SERIAL_CATCHPIC_PARA;
    dwTriggerPicTimes: array[0..MAX_CHANNUM - 1] of DWORD; //* ÿ��ͨ��һ�δ������մ��� */
    dwAlarmInPicChanTriggered: array[0..MAX_ALARMIN - 1] of DWORD; //*��������ץ��ͨ��,��λ���ã��ӵ�0λ��ʼ*/
  end;

  //typedef struct tagGetJpeg
  LPNET_DVR_GETJPEG = ^NET_DVR_GETJPEG;
  NET_DVR_GETJPEG = record
    dwReturn: DWORD; //*�Ƿ�ֱ�ӷ���ͼƬ����*/
    dwUploadFtp: DWORD; //*�Ƿ��ϴ�Ftp������*/
    dwSaveHd: DWORD; //*�Ƿ񱣴浽�豸Ӳ��*/
    sImageName: array[0..PATHNAME_LEN - 1] of char; //*�Զ��������ͼƬ�ļ���*/
    sOsdStr: char_16; //*��Ҫ������ͼƬ�ϵ�OSD�ַ���*/
    wOsdLen: WORD; //*OSD�ַ�������*/
  end;

  // HS�豸�����������
  // typedef struct tagAUXOUT{
  LPNET_DVR_AUXOUTCFG = ^NET_DVR_AUXOUTCFG;
  NET_DVR_AUXOUTCFG = record
    dwSize: DWORD;
    dwAlarmOutChan: DWORD; //* ѡ�񱨾�������������ͨ��: 0:�����/1:��1/2:��2/3:��3/4:��4 */
    dwAlarmChanSwitchTime: DWORD; //* ����ͨ���л�ʱ�䣺1:1�� - 10:10�� */
    dwAuxSwitchTime: array[0..MAX_AUXOUT - 1] of DWORD; //* ��������л�ʱ��: 0-���л�,1-5s,2-10s,3-20s,4-30s,5-60s,6-120s,7-300s */
    byAuxOrder: array[0..MAX_AUXOUT - 1, 0..MAX_WINDOW - 1] of BYTE; //* �������Ԥ��˳��, $ff��ʾ��Ӧ�Ĵ��ڲ�Ԥ�� */
  end;



// ��ʼ�����ͷ�
function NET_DVR_Init(): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_Init';
function NET_DVR_Cleanup(): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_Cleanup';
function NET_DVR_SetDVRMessage(nMessage: UINT; handle: HWND): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_SetDVRMessage';

type
  PfMessCallBack = ^TfMessCallBack;
  TfMessCallBack = function(lCommand: LONG; sDVRIP: Pchar; pBuf: Pchar; dwBufLen: DWORD): boolean of object;
function NET_DVR_SetDVRMessCallBack(fMessCallBack: PfMessCallBack): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_SetDVRMessCallBack';
//NET_DVR_API BOOL __stdcall NET_DVR_SetDVRMessCallBack(   BOOL (CALLBACK *fMessCallBack)   (LONG lCommand,char *sDVRIP,char *pBuf,DWORD dwBufLen));

type
  PfMessCallBack_Ex = ^TfMessCallBack_Ex;
  TfMessCallBack_Ex = function(lCommand: LONG; lUserID: LONG; pBuf: Pchar; dwBufLen: DWORD): BOOL of object;
function NET_DVR_SetDVRMessCallBack_EX(fMessCallBack_Ex: PfMessCallBack_Ex): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_SetDVRMessCallBack_EX';
//NET_DVR_API BOOL __stdcall NET_DVR_SetDVRMessCallBack_EX(BOOL (CALLBACK *fMessCallBack_EX)(LONG lCommand,LONG lUserID,char *pBuf,DWORD dwBufLen));

function NET_DVR_SetConnectTime(dwWaitTime, dwTryTimes: DWORD): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_SetConnectTime';
function NET_DVR_GetSDKVersion(): DWORD; stdcall; external NET_DVR_API name 'NET_DVR_GetSDKVersion';

function NET_DVR_IsSupport(): int; stdcall; external NET_DVR_API name 'NET_DVR_IsSupport';
function NET_DVR_StartListen(sLocalIP: Pchar; wLocalPort: WORD): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_StartListen';
function NET_DVR_StopListen(): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_StopListen';
function NET_DVR_Login(sDVRIP: Pchar; wDVRPort: WORD; sUserName, sPassword: Pchar; lpDeviceInfo: LPNET_DVR_DEVICEINFO): LONG; stdcall; external NET_DVR_API name 'NET_DVR_Login';
function NET_DVR_Logout(lUserID: LONG): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_Logout';
function NET_DVR_Login_V30(sDVRIP: Pchar; wDVRPort: WORD; sUserName, sPassword: Pchar; lpDeviceInfo: LPNET_DVR_DEVICEINFO): LONG; stdcall; external NET_DVR_API name 'NET_DVR_Login_V30';
function NET_DVR_Logout_V30(lUserID: LONG): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_Logout_V30';

function NET_DVR_GetLastError(): DWORD; stdcall; external NET_DVR_API name 'NET_DVR_GetLastError';
function NET_DVR_SetShowMode(dwShowType: DWORD; colorKey: COLORREF): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_SetShowMode';
function NET_DVR_GetDVRIPByResolveSvr(sServerIP: Pchar; wServerPort: WORD; sDVRName: PByte; wDVRNameLen: WORD; sDVRSerialNumber: PByte; wDVRSerialLen: WORD; sGetIP: Pchar): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_GetDVRIPByResolveSvr';

//ͼ��Ԥ��
function NET_DVR_RealPlay(lUserID: LONG; lpClientInfo: LPNET_DVR_CLIENTINFO): LONG; stdcall; external NET_DVR_API name 'NET_DVR_RealPlay';
function NET_DVR_StopRealPlay(lRealHandle: LONG): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_StopRealPlay';
type
  PfRealDataCallBack_V30 = ^TfRealDataCallBack_V30;
  TfRealDataCallBack_V30 = procedure(lRealHandle: LONG; dwDataType: DWORD; pBuffer: PBYTE; dwBufSize, dwUser: Pointer) of object; stdcall;
function NET_DVR_RealPlay_V30(lUserID: LONG; lpClientInfo: LPNET_DVR_CLIENTINFO; fRealDataCallBack_V30: PfRealDataCallBack_V30; pUser: Pointer; bBlocked: Boolean): LONG; stdcall; external NET_DVR_API name 'NET_DVR_RealPlay_V30';
type
  PfRealDataCallBack_V40 = ^TfRealDataCallBack_V40;
  TfRealDataCallBack_V40 = procedure(lRealHandle: LONG; dwDataType: DWORD; pBuffer: PBYTE; dwBufSize, dwUser: Pointer) of object; stdcall;
function NET_DVR_RealPlay_V40(lUserID: LONG; lpClientInfo: LPNET_DVR_CLIENTINFO_V40; fRealDataCallBack_V40: PfRealDataCallBack_V30; pUser: Pointer): LONG; stdcall; external NET_DVR_API name 'NET_DVR_RealPlay_V40';
function NET_DVR_SetStandardDataCallBack(lUserID:long;fRealDataCallBack_V30:PfRealDataCallBack_V40;puser:Pointer):Boolean; stdcall; external NET_DVR_API name 'NET_DVR_SetStandardDataCallBack';
//��Ƶ����������ֵ 1-10
function NET_DVR_ClientSetVideoEffect(lRealHandle: LONG; dwBrightValue, dwContrastValue, dwSaturationValue, dwHueValue: DWORD): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_ClientSetVideoEffect';
function NET_DVR_ClientGetVideoEffect(lRealHandle: LONG; var pBrightValue, pContrastValue, pSaturationValue, pHueValue: DWORD): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_ClientGetVideoEffect';
type
  PfDrawFun = ^TfDrawFun;
  TfDrawFun = procedure(lRealHandle: LONG; Dc: HDC; dwUser: DWORD) of object; stdcall;
function NET_DVR_RigisterDrawFun(lRealHandle: LONG; PfDrawFun: PfDrawFun; dwUser: DWORD): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_RigisterDrawFun';
  // NET_DVR_API BOOL __stdcall NET_DVR_RigisterDrawFun(LONG lRealHandle,void (CALLBACK* fDrawFun)(LONG lRealHandle,HDC hDc,DWORD dwUser),DWORD dwUser);
function NET_DVR_SetPlayerBufNumber(lRealHandle: LONG; dwBufNum: DWORD): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_SetPlayerBufNumber';
  // ��B֡
function NET_DVR_ThrowBFrame(lRealHandle: LONG; dwNum: DWORD): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_ThrowBFrame';
function NET_DVR_SetAudioMode(dwMode: DWORD): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_SetAudioMode';
function NET_DVR_OpenSound(lRealHandle: LONG): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_OpenSound';
function NET_DVR_CloseSound(): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_CloseSound';
function NET_DVR_OpenSoundShare(lRealHandle: LONG): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_OpenSoundShare';
function NET_DVR_CloseSoundShare(lRealHandle: LONG): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_CloseSoundShare';
function NET_DVR_Volume(lRealHandle: LONG; wVolume: WORD): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_Volume';

function NET_DVR_SaveRealData(lRealHandle: LONG; sFileName: Pchar): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_SaveRealData';
function NET_DVR_StopSaveRealData(lRealHandle: LONG): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_StopSaveRealData';

type
  PfRealDataCallBack = ^TfRealDataCallBack;
  TfRealDataCallBack = procedure(lRealHandle: LONG; dwDataType: DWORD; pBuffer: PBYTE; dwBufSize: DWORD; pUser: Pointer) of object;

function NET_DVR_SetRealDataCallBack(lRealHandle: LONG; fRealDataCallBack: PfRealDataCallBack; dwUser: DWORD): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_SetRealDataCallBack';
  // NET_DVR_API BOOL __stdcall NET_DVR_SetRealDataCallBack(LONG lRealHandle,void(CALLBACK *fRealDataCallBack) (LONG lRealHandle, DWORD dwDataType, BYTE *pBuffer,DWORD dwBufSize,DWORD dwUser),DWORD dwUser);
function NET_DVR_CapturePicture(lRealHandle: LONG; sPicFileName: Pchar): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_CapturePicture';
function NET_DVR_MakeKeyFrame(lUserID: LONG; lChannel: LONG): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_MakeKeyFrame';

  //��̨����
function NET_DVR_PTZControl(lRealHandle: LONG; dwPTZCommand, dwStop: DWORD): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_PTZControl';
function NET_DVR_PTZControl_Other(lUserID, lChannel: LONG; dwPTZCommand, dwStop: DWORD): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_PTZControl_Other';
function NET_DVR_TransPTZ(lRealHandle: LONG; pPTZCodeBuf: Pchar; dwBufSize: DWORD): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_TransPTZ';
function NET_DVR_TransPTZ_Other(lUserID, lChannel: LONG; pPTZCodeBuf: Pchar; dwBufSize: DWORD): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_TransPTZ_Other';
function NET_DVR_PTZPreset(lRealHandle: LONG; dwPTZPresetCmd, dwPresetIndex: DWORD): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_PTZPreset';
function NET_DVR_PTZPreset_Other(lUserID, lChannel: LONG; dwPTZPresetCmd, dwPresetIndex: DWORD): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_PTZPreset_Other';
function NET_DVR_TransPTZ_EX(lRealHandle: LONG; pPTZCodeBuf: Pchar; dwBufSize: DWORD): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_TransPTZ_EX';
function NET_DVR_PTZControl_EX(lRealHandle: LONG; dwPTZCommand, dwStop: DWORD): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_PTZControl_EX';
function NET_DVR_PTZPreset_EX(lRealHandle: LONG; dwPTZPresetCmd, dwPresetIndex: DWORD): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_PTZPreset_EX';
function NET_DVR_PTZCruise(lRealHandle: LONG; dwPTZCruiseCmd: DWORD; byCruiseRoute, byCruisePoint: BYTE; wInput: WORD): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_PTZCruise';
function NET_DVR_PTZCruise_Other(lUserID, lChannel: LONG; dwPTZCruiseCmd: DWORD; byCruiseRoute, byCruisePoint: BYTE; wInput: WORD): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_PTZCruise_Other';
function NET_DVR_PTZCruise_EX(lRealHandle: LONG; dwPTZCruiseCmd: DWORD; byCruiseRoute, byCruisePoint: BYTE; wInput: WORD): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_PTZCruise_EX';
function NET_DVR_PTZTrack(lRealHandle: LONG; dwPTZTrackCmd: DWORD): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_PTZTrack';
function NET_DVR_PTZTrack_Other(lUserID, lChannel: LONG; dwPTZTrackCmd: DWORD): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_PTZTrack_Other';
function NET_DVR_PTZTrack_EX(lRealHandle: LONG; dwPTZTrackCmd: DWORD): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_PTZTrack_EX';

//���ٶȵ���̨����
function NET_DVR_PTZControlWithSpeed(lRealHandle: LONG; dwPTZCommand, dwStop, dwSpeed: DWORD): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_PTZControlWithSpeed';
function NET_DVR_PTZControlWithSpeed_Other(lUserID, lChannel: LONG; dwPTZCommand, dwStop, dwSpeed: DWORD): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_PTZControlWithSpeed_Other';

//�ļ��ط�
function NET_DVR_FindFile(lUserID, lChannel: LONG; dwFileType: DWORD; lpStartTime, lpStopTime: LPNET_DVR_TIME): LONG; stdcall; external NET_DVR_API name 'NET_DVR_FindFile';
function NET_DVR_FindNextFile(lFindHandle: LONG; lpFindData: LPNET_DVR_FIND_DATA): LONG; stdcall; external NET_DVR_API name 'NET_DVR_FindNextFile';
function NET_DVR_FindClose(lFindHandle: LONG): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_FindClose';
function NET_DVR_PlayBackByName(lUserID: LONG; sPlayBackFileName: Pchar; Handle: HWND): LONG; stdcall; external NET_DVR_API name 'NET_DVR_PlayBackByName';
function NET_DVR_PlayBackByTime(lUserID, lChannel: LONG; lpStartTime, lpStopTime: LPNET_DVR_TIME; Handle: HWND): LONG; stdcall; external NET_DVR_API name 'NET_DVR_PlayBackByTime';
function NET_DVR_PlayBackControl(lPlayHandle: LONG; dwControlCode, dwInValue: DWORD; var lpOutValue: DWORD): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_PlayBackControl';
function NET_DVR_StopPlayBack(lPlayHandle: LONG): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_StopPlayBack';

//V3.0
function NET_DVR_FindFile_V30(lUserID: LONG; pFindCond: LPNET_DVR_FILECOND): LONG; stdcall; external NET_DVR_API name 'NET_DVR_FindFile_V30';
function NET_DVR_FindNextFile_V30(lFindHandle: LONG; lpFindData: LPNET_DVR_FIND_DATA): LONG; stdcall; external NET_DVR_API name 'NET_DVR_FindNextFile_V30';
function NET_DVR_FindClose_V30(lFindHandle: LONG): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_FindClose_V30';

//V4.0
function NET_DVR_FindFile_V40(lUserID: LONG; pFindCond: LPNET_DVR_FILECOND): LONG; stdcall; external NET_DVR_API name 'NET_DVR_FindFile_V40';
function NET_DVR_PlayBackControl_V40(lPlayHandle: LONG; dwControlCode: DWORD; lpInBuffer: Pointer; dwInValue: DWORD; lpOutBuffer: Pointer;var lpOutValue: DWORD): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_PlayBackControl_V40';


type
  PfPlayDataCallBack = ^TfPlayDataCallBack;
  TfPlayDataCallBack = procedure(lPlayHandle: LONG; dwDataType: DWORD; pBuffer: PBYTE; dwBufSize, dwUser: DWORD) of object;
function NET_DVR_SetPlayDataCallBack(lPlayHandle: LONG; fPlayDataCallBack: PfPlayDataCallBack; dwUser: DWORD): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_SetPlayDataCallBack';
  //?? NET_DVR_API BOOL __stdcall NET_DVR_SetPlayDataCallBack(LONG lPlayHandle,void(CALLBACK *fPlayDataCallBack) (LONG lPlayHandle, DWORD dwDataType, BYTE *pBuffer,DWORD dwBufSize,DWORD dwUser),DWORD dwUser);

function NET_DVR_PlayBackSaveData(lPlayHandle: LONG; sFileName: Pchar): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_PlayBackSaveData';
function NET_DVR_StopPlayBackSave(lPlayHandle: LONG): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_StopPlayBackSave';

function NET_DVR_GetPlayBackOsdTime(lPlayHandle: LONG; lpOsdTime: LPNET_DVR_TIME): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_GetPlayBackOsdTime';
function NET_DVR_PlayBackCaptureFile(lPlayHandle: LONG; sFileName: Pchar): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_PlayBackCaptureFile';
function NET_DVR_GetFileByName(lUserID: LONG; sDVRFileName, sSavedFileName: Pchar): LONG; stdcall; external NET_DVR_API name 'NET_DVR_GetFileByName';
function NET_DVR_GetFileByTime(lUserID, lChannel: LONG; lpStartTime, lpStopTime: LPNET_DVR_TIME; sSavedFileName: Pchar): LONG; stdcall; external NET_DVR_API name 'NET_DVR_GetFileByTime';
function NET_DVR_StopGetFile(lFileHandle: LONG): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_StopGetFile';
function NET_DVR_GetDownloadPos(lFileHandle: LONG): int; stdcall; external NET_DVR_API name 'NET_DVR_GetDownloadPos';

//�ָ�Ĭ��ֵ
function NET_DVR_RestoreConfig(lUserID: LONG): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_RestoreConfig';

//�������
function NET_DVR_SaveConfig(lUserID: LONG): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_SaveConfig';
//����
function NET_DVR_RebootDVR(lUserID: LONG): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_RebootDVR';
//�ر�DVR
function NET_DVR_ShutDownDVR(lUserID: LONG): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_ShutDownDVR';
//����
function NET_DVR_Upgrade(lUserID: LONG; sFileName: Pchar): LONG; stdcall; external NET_DVR_API name 'NET_DVR_Upgrade';
function NET_DVR_GetUpgradeState(lUpgradeHandle: LONG): int; stdcall; external NET_DVR_API name 'NET_DVR_GetUpgradeState';
function NET_DVR_CloseUpgradeHandle(lUpgradeHandle: LONG): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_CloseUpgradeHandle';
//Զ�̸�ʽ��Ӳ��
function NET_DVR_FormatDisk(lUserID, lDiskNumber: LONG): LONG; stdcall; external NET_DVR_API name 'NET_DVR_FormatDisk';
function NET_DVR_GetFormatProgress(lFormatHandle: LONG; var pCurrentFormatDisk, pCurrentDiskPos, pFormatStatic: LONG): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_GetFormatProgress';
function NET_DVR_CloseFormatHandle(lFormatHandle: LONG): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_CloseFormatHandle';
//����
function NET_DVR_SetupAlarmChan(lUserID: LONG): LONG; stdcall; external NET_DVR_API name 'NET_DVR_SetupAlarmChan';
function NET_DVR_CloseAlarmChan(lAlarmHandle: LONG): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_CloseAlarmChan';
function NET_DVR_GetAlarmOut(lUserID: LONG; lpAlarmOutState: LPNET_DVR_ALARMOUTSTATUS): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_GetAlarmOut';
function NET_DVR_SetAlarmOut(lUserID, lAlarmOutPort, lAlarmOutStatic: LONG): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_SetAlarmOut';

type
//�����Խ�
  PfVoiceDataCallBack = ^TfVoiceDataCallBack;
  TfVoiceDataCallBack = procedure(lVoiceComHandle: LONG; pRecvDataBuffer: Pchar; dwBufSize: DWORD; byAudioFlag: BYTE; dwUser: DWORD) of object;
function NET_DVR_StartVoiceCom(lUserID: LONG; fVoiceDataCallBack: PfVoiceDataCallBack; dwUser: DWORD): LONG; stdcall; external NET_DVR_API name 'NET_DVR_StartVoiceCom';
  // NET_DVR_API LONG __stdcall NET_DVR_StartVoiceCom(LONG lUserID, void(CALLBACK *fVoiceDataCallBack)(LONG lVoiceComHandle,char *pRecvDataBuffer,DWORD dwBufSize,BYTE byAudioFlag,DWORD dwUser), DWORD dwUser);
function NET_DVR_SetVoiceComClientVolume(lVoiceComHandle: LONG; wVolume: WORD): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_SetVoiceComClientVolume';
function NET_DVR_StopVoiceCom(lVoiceComHandle: LONG): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_StopVoiceCom';
//�����㲥
function NET_DVR_ClientAudioStart(): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_ClientAudioStart';
function NET_DVR_ClientAudioStop(): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_ClientAudioStop';
function NET_DVR_AddDVR(lUserID: LONG): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_AddDVR';
function NET_DVR_DelDVR(lUserID: LONG): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_DelDVR';


  //����ת��
function NET_DVR_StartVoiceCom_MR(lUserID: LONG; fVoiceDataCallBack: PfVoiceDataCallBack; dwUser: DWORD): LONG; stdcall; external NET_DVR_API name 'NET_DVR_StartVoiceCom_MR';
  // NET_DVR_API LONG __stdcall NET_DVR_StartVoiceCom_MR(LONG lUserID, void(CALLBACK *fVoiceDataCallBack)(LONG lVoiceComHandle,char *pRecvDataBuffer,DWORD dwBufSize,BYTE byAudioFlag,DWORD dwUser), DWORD dwUser);
function NET_DVR_VoiceComSendData(lVoiceComHandle: LONG; pSendBuf: Pchar; dwBufSize: DWORD): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_VoiceComSendData';

  ////////////////////////////////////////////////////////////
type
  //͸��ͨ������
  PfSerialDataCallBack = ^TfSerialDataCallBack;
  TfSerialDataCallBack = procedure(lSerialHandle: LONG; pRecvDataBuffer: Pchar; dwBufSize, dwUser: DWORD);
function NET_DVR_SerialStart(lUserID, lSerialPort: LONG; fSerialDataCallBack: PfSerialDataCallBack; dwUser: DWORD): LONG; stdcall; external NET_DVR_API name 'NET_DVR_SerialStart';
  // NET_DVR_API LONG __stdcall NET_DVR_SerialStart(LONG lUserID,LONG lSerialPort,void(CALLBACK *fSerialDataCallBack)(LONG lSerialHandle,char *pRecvDataBuffer,DWORD dwBufSize,DWORD dwUser),DWORD dwUser);
function NET_DVR_SerialSend(lSerialHandle, lChannel: LONG; pSendBuf: Pchar; dwBufSize: DWORD): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_SerialSend';
function NET_DVR_SerialStop(lSerialHandle: LONG): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_SerialStop';
function NET_DVR_SendTo232Port(lUserID: LONG; pSendBuf: Pchar; dwBufSize: DWORD): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_SendTo232Port';

//Զ�̿��Ʊ�����ʾ
function NET_DVR_ClickKey(lUserID, lKeyIndex: LONG): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_ClickKey';
//Զ�̿����ֶ�¼��
function NET_DVR_StartDVRRecord(lUserID, lChannel, lRecordType: LONG): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_StartDVRRecord';
function NET_DVR_StopDVRRecord(lUserID, lChannel: LONG): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_StopDVRRecord';

{  //���뿨
  function AAAAA( ) : BOOL ; stdcall ; external NET_DVR_API name 'AAAA';
  function AAAAA( ) : BOOL ; stdcall ; external NET_DVR_API name 'AAAA';
  function AAAAA( ) : BOOL ; stdcall ; external NET_DVR_API name 'AAAA';
  function AAAAA( ) : BOOL ; stdcall ; external NET_DVR_API name 'AAAA';
  function AAAAA( ) : BOOL ; stdcall ; external NET_DVR_API name 'AAAA';
  function AAAAA( ) : BOOL ; stdcall ; external NET_DVR_API name 'AAAA';
  function AAAAA( ) : BOOL ; stdcall ; external NET_DVR_API name 'AAAA';
  function AAAAA( ) : BOOL ; stdcall ; external NET_DVR_API name 'AAAA';
  function AAAAA( ) : BOOL ; stdcall ; external NET_DVR_API name 'AAAA';
  function AAAAA( ) : BOOL ; stdcall ; external NET_DVR_API name 'AAAA';

NET_DVR_API BOOL __stdcall NET_DVR_InitDevice_Card(long *pDeviceTotalChan);
NET_DVR_API BOOL __stdcall NET_DVR_ReleaseDevice_Card();
NET_DVR_API BOOL __stdcall NET_DVR_InitDDraw_Card(HWND hParent,COLORREF colorKey);
NET_DVR_API BOOL __stdcall NET_DVR_ReleaseDDraw_Card();
NET_DVR_API LONG __stdcall NET_DVR_RealPlay_Card(LONG lUserID,LPNET_DVR_CARDINFO lpCardInfo,long lChannelNum);
NET_DVR_API BOOL __stdcall NET_DVR_ResetPara_Card(LONG lRealHandle,LPNET_DVR_DISPLAY_PARA lpDisplayPara);
NET_DVR_API BOOL __stdcall NET_DVR_RefreshSurface_Card();
NET_DVR_API BOOL __stdcall NET_DVR_ClearSurface_Card();
NET_DVR_API BOOL __stdcall NET_DVR_RestoreSurface_Card();
NET_DVR_API BOOL __stdcall NET_DVR_OpenSound_Card(LONG lRealHandle);

  function AAAAA( ) : BOOL ; stdcall ; external NET_DVR_API name 'AAAA';
  function AAAAA( ) : BOOL ; stdcall ; external NET_DVR_API name 'AAAA';
  function AAAAA( ) : BOOL ; stdcall ; external NET_DVR_API name 'AAAA';
  function AAAAA( ) : BOOL ; stdcall ; external NET_DVR_API name 'AAAA';
  function AAAAA( ) : BOOL ; stdcall ; external NET_DVR_API name 'AAAA';
  function AAAAA( ) : BOOL ; stdcall ; external NET_DVR_API name 'AAAA';
  function AAAAA( ) : BOOL ; stdcall ; external NET_DVR_API name 'AAAA';
  function AAAAA( ) : BOOL ; stdcall ; external NET_DVR_API name 'AAAA';
NET_DVR_API BOOL __stdcall NET_DVR_CloseSound_Card(LONG lRealHandle);
NET_DVR_API BOOL __stdcall NET_DVR_SetVolume_Card(LONG lRealHandle,WORD wVolume);
NET_DVR_API BOOL __stdcall NET_DVR_AudioPreview_Card(LONG lRealHandle,BOOL bEnable);
NET_DVR_API BOOL __stdcall NET_DVR_CapturePicture_Card(LONG lRealHandle, char *sPicFileName);
NET_DVR_API BOOL __stdcall NET_DVR_SetDspErrMsg_Card(UINT nMessage,HWND hWnd);
NET_DVR_API BOOL __stdcall NET_DVR_ResetDSP_Card(long lChannelNum);
NET_DVR_API BOOL __stdcall NET_DVR_GetSerialNum_Card(long lChannelNum,DWORD *pDeviceSerialNo);
NET_DVR_API HANDLE __stdcall NET_DVR_GetChanHandle_Card(LONG lRealHandle);
}
//������״̬

function NET_DVR_GetDVRWorkState(lUserID: LONG; lpWorkState: LPNET_DVR_WORKSTATE): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_GetDVRWorkState';
function NET_DVR_GetDVRWorkState_V30(lUserID: LONG; lpWorkState: LPNET_DVR_WORKSTATE_V30): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_GetDVRWorkState_V30';



//��־
function NET_DVR_FindDVRLog(lUserID, lSelectMode: LONG; dwMajorType, dwMinorType: DWORD; lpStartTime, lpStopTime: LPNET_DVR_TIME): LONG; stdcall; external NET_DVR_API name 'NET_DVR_FindDVRLog';
function NET_DVR_FindNextLog(lLogHandle: LONG; lpLogData: LPNET_DVR_LOG): LONG; stdcall; external NET_DVR_API name 'NET_DVR_FindNextLog';
function NET_DVR_FindLogClose(lLogHandle: LONG): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_FindLogClose';

//��������
function NET_DVR_GetDVRConfig(lUserID: LONG; dwCommand: DWORD; lChannel: LONG; lpOutBuffer: pointer; dwOutBufferSize: DWORD; lpBytesReturned: LPDWORD): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_GetDVRConfig';
function NET_DVR_SetDVRConfig(lUserID: LONG; dwCommand: DWORD; lChannel: LONG; lpInBuffer: pointer; dwInBufferSize: DWORD): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_SetDVRConfig';

  //NET_DVR_API BOOL __stdcall NET_DVR_GetDVRConfig(LONG lUserID, DWORD dwCommand,LONG lChannel, LPVOID lpOutBuffer,DWORD dwOutBufferSize,LPDWORD lpBytesReturned);
  //NET_DVR_API BOOL __stdcall NET_DVR_SetDVRConfig(LONG lUserID, DWORD dwCommand,LONG lChannel, LPVOID lpInBuffer,DWORD dwInBufferSize);

{
//��ֹ2004��8��5��,��113���ӿ�

  function AAAAA( ) : BOOL ; stdcall ; external NET_DVR_API name 'AAAA';
  function AAAAA( ) : BOOL ; stdcall ; external NET_DVR_API name 'AAAA';
  function AAAAA( ) : BOOL ; stdcall ; external NET_DVR_API name 'AAAA';
NET_DVR_API BOOL __stdcall NET_DVR_ClientGetframeformat(LONG lUserID, LPNET_DVR_FRAMEFORMAT lpFrameFormat);
NET_DVR_API BOOL __stdcall NET_DVR_ClientSetframeformat(LONG lUserID, LPNET_DVR_FRAMEFORMAT lpFrameFormat);
NET_DVR_API LONG __stdcall NET_DVR_FindFileByCard(LONG lUserID,LONG lChannel,DWORD dwFileType, BOOL bNeedCardNum, BYTE *sCardNumber, LPNET_DVR_TIME lpStartTime, LPNET_DVR_TIME lpStopTime);
//��ֹ2004��10��5��,��116���ӿ�

//����
  function AAAAA( ) : BOOL ; stdcall ; external NET_DVR_API name 'AAAA';
  function AAAAA( ) : BOOL ; stdcall ; external NET_DVR_API name 'AAAA';
  function AAAAA( ) : BOOL ; stdcall ; external NET_DVR_API name 'AAAA';
NET_DVR_API void* __stdcall NET_DVR_InitG722Decoder(int nBitrate);
NET_DVR_API void __stdcall NET_DVR_ReleaseG722Decoder(void *pDecHandle);
NET_DVR_API BOOL __stdcall NET_DVR_DecodeG722Frame(void *pDecHandle, unsigned char* pInBuffer, unsigned char* pOutBuffer);
//����
  function AAAAA( ) : BOOL ; stdcall ; external NET_DVR_API name 'AAAA';
  function AAAAA( ) : BOOL ; stdcall ; external NET_DVR_API name 'AAAA';
  function AAAAA( ) : BOOL ; stdcall ; external NET_DVR_API name 'AAAA';
NET_DVR_API void* __stdcall NET_DVR_InitG722Encoder();
NET_DVR_API BOOL __stdcall NET_DVR_EncodeG722Frame(void *pEncodeHandle,unsigned char* pInBuffer, unsigned char* pOutBuffer);
NET_DVR_API void __stdcall NET_DVR_ReleaseG722Encoder(void *pEncodeHandle);
//��������
  function AAAAA( ) : BOOL ; stdcall ; external NET_DVR_API name 'AAAA';
  function AAAAA( ) : BOOL ; stdcall ; external NET_DVR_API name 'AAAA';
  function AAAAA( ) : BOOL ; stdcall ; external NET_DVR_API name 'AAAA';
  function AAAAA( ) : BOOL ; stdcall ; external NET_DVR_API name 'AAAA';
NET_DVR_API BOOL __stdcall NET_DVR_GetConfigFile(LONG lUserID, char *sFileName);
NET_DVR_API BOOL __stdcall NET_DVR_SetConfigFile(LONG lUserID, char *sFileName);
NET_DVR_API BOOL __stdcall NET_DVR_GetConfigFile_EX(LONG lUserID, char *sOutBuffer, DWORD dwOutSize);
NET_DVR_API BOOL __stdcall NET_DVR_SetConfigFile_EX(LONG lUserID, char *sInBuffer, DWORD dwInSize);
//6001D/F�����豸�ӿ�
  function AAAAA( ) : BOOL ; stdcall ; external NET_DVR_API name 'AAAA';
  function AAAAA( ) : BOOL ; stdcall ; external NET_DVR_API name 'AAAA';
  function AAAAA( ) : BOOL ; stdcall ; external NET_DVR_API name 'AAAA';
  function AAAAA( ) : BOOL ; stdcall ; external NET_DVR_API name 'AAAA';
  function AAAAA( ) : BOOL ; stdcall ; external NET_DVR_API name 'AAAA';
  function AAAAA( ) : BOOL ; stdcall ; external NET_DVR_API name 'AAAA';
  function AAAAA( ) : BOOL ; stdcall ; external NET_DVR_API name 'AAAA';
  function AAAAA( ) : BOOL ; stdcall ; external NET_DVR_API name 'AAAA';
  function AAAAA( ) : BOOL ; stdcall ; external NET_DVR_API name 'AAAA';
  function AAAAA( ) : BOOL ; stdcall ; external NET_DVR_API name 'AAAA';
NET_DVR_API BOOL __stdcall NET_DVR_SetDecInfo(LONG lUserID, LONG lChannel, LPNET_DVR_DECCFG lpDecoderinfo);
NET_DVR_API BOOL __stdcall NET_DVR_GetDecInfo(LONG lUserID, LONG lChannel, LPNET_DVR_DECCFG lpDecoderinfo);
NET_DVR_API BOOL __stdcall NET_DVR_SetDecTransPort(LONG lUserID, LPNET_DVR_PORTCFG lpTransPort);
NET_DVR_API BOOL __stdcall NET_DVR_GetDecTransPort(LONG lUserID, LPNET_DVR_PORTCFG lpTransPort);
NET_DVR_API BOOL __stdcall NET_DVR_DecPlayBackCtrl(LONG lUserID, LONG lChannel, DWORD dwControlCode, DWORD dwInValue,DWORD *lpOutValue, LPNET_DVR_PLAYREMOTEFILE lpRemoteFileInfo);
NET_DVR_API BOOL __stdcall NET_DVR_StartDecSpecialCon(LONG lUserID, LONG lChannel, LPNET_DVR_DECCHANINFO lpDecChanInfo);
NET_DVR_API BOOL __stdcall NET_DVR_StopDecSpecialCon(LONG lUserID, LONG lChannel, LPNET_DVR_DECCHANINFO lpDecChanInfo);
NET_DVR_API BOOL __stdcall NET_DVR_DecCtrlDec(LONG lUserID, LONG lChannel, DWORD dwControlCode);
NET_DVR_API BOOL __stdcall NET_DVR_DecCtrlScreen(LONG lUserID, LONG lChannel, DWORD dwControl);
NET_DVR_API BOOL __stdcall NET_DVR_GetDecCurLinkStatus(LONG lUserID, LONG lChannel, LPNET_DVR_DECSTATUS lpDecStatus);
}
//JPEGץͼ
function NET_DVR_CaptureJPEGPicture(lUserID, lChannel: LONG; lpJpegPara: LPNET_DVR_JPEGPARA; sPicFileName: Pchar): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_CaptureJPEGPicture';
//��֡���ݲ��񲢱����JPEG�����ָ�����ڴ�ռ��С�
function NET_DVR_CaptureJPEGPicture_NEW(lUserID, lChannel: LONG; lpJpegPara: LPNET_DVR_JPEGPARA; sJpegPicBuffer: Pchar; dwPicSize: DWORD; lpSizeReturned: PDWORD): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_CaptureJPEGPicture_NEW';

//ATM PORT����
function NET_DVR_SetATMPortCFG(lUserID: LONG; wATMPort: WORD): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_SetATMPortCFG';
function NET_DVR_GetATMPortCFG(lUserID: LONG; var lpOutATMPort: WORD): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_GetATMPortCFG';

//�����Ƿ��������Žӿ�
function NET_DVR_SetScaleCFG(lUserID: LONG; dwScale: DWORD): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_SetScaleCFG';
function NET_DVR_GetScaleCFG(lUserID: LONG; var lpOutScale: DWORD): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_GetScaleCFG';
function NET_DVR_GetRealPlayerIndex(lRealHandle: LONG): Int; stdcall; external NET_DVR_API name 'NET_DVR_GetRealPlayerIndex';
function NET_DVR_GetPlayBackPlayerIndex(lPlayHandle: LONG): Int; stdcall; external NET_DVR_API name 'NET_DVR_GetPlayBackPlayerIndex';
{
//֧���Կ�
#if (WINVER > $0400)
//Note: These funtion must be builded under win2000 or above with Microsoft Platform sdk.
//	    You can download the sdk from "http://www.microsoft.com/msdownload/platformsdk/sdkupdate/";
NET_DVR_API BOOL __stdcall NET_DVR_InitDDrawDevice();
NET_DVR_API BOOL __stdcall NET_DVR_ReleaseDDrawDevice();
NET_DVR_API LONG __stdcall NET_DVR_GetDDrawDeviceTotalNums();
NET_DVR_API BOOL __stdcall NET_DVR_SetDDrawDevice(LONG lPlayPort, DWORD nDeviceNum);
#endif
}

function NET_DVR_RefreshPlay(lPlayHandle: LONG): BOOL; stdcall; external NET_DVR_API name 'NET_DVR_RefreshPlay';

implementation

end.
