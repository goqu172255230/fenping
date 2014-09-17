unit DHNetSDKUnit;
interface

uses windows;


const

  DHNetSDK_API = 'dhnetsdk.dll';

//************************************************************************
// ** �ӿ�ö�ٶ���
// ***********************************************************************/
//ͨ����̨��������
type

  UChar = byte; // unsigned char
  LONG = LongInt; //
  ULong = Dword; // unsigned long
  USHORT = word; // unsigned short
  Bool = Boolean;
  Int = Integer;
  Char_2 = array[0..1] of char;
  Char_4 = array[0..3] of char;
  Char_6 = array[0..5] of char;
  Char_8 = array[0..7] of char;
  Char_10 = array[0..9] of char;
  Char_12 = array[0..11] of char;
  Char_16 = array[0..15] of char;
  Char_17 = array[0..16] of char;
  Char_20 = array[0..19] of char;
  Char_32 = array[0..31] of char;
  Char_48 = array[0..47] of char;
  Char_128 = array[0..127] of char;

const
  PTZ_UP_CONTROL = 0; //��
  PTZ_DOWN_CONTROL = 1; //��
  PTZ_LEFT_CONTROL = 2; //��
  PTZ_RIGHT_CONTROL = 3; //��
  PTZ_ZOOM_ADD_CONTROL = 4; //�䱶+
  PTZ_ZOOM_DEC_CONTROL = 5; //�䱶-
  PTZ_FOCUS_ADD_CONTROL = 6; //����+
  PTZ_FOCUS_DEC_CONTROL = 7; //����-
  PTZ_APERTURE_ADD_CONTROL = 8; //��Ȧ+
  PTZ_APERTURE_DEC_CONTROL = 9; //��Ȧ-
  PTZ_POINT_MOVE_CONTROL = 10; //ת��Ԥ�õ�
  PTZ_POINT_SET_CONTROL = 11; //����
  PTZ_POINT_DEL_CONTROL = 12; //ɾ��
  PTZ_POINT_LOOP_CONTROL = 13; //�����ѭ
  PTZ_LAMP_CONTROL = 14; //�ƹ���ˢ

//
//type
//  PTZ_ControlType = (
//    PTZ_UP_CONTROL = 0, //��
//    PTZ_DOWN_CONTROL, //��
//    PTZ_LEFT_CONTROL, //��
//    PTZ_RIGHT_CONTROL, //��
//    PTZ_ZOOM_ADD_CONTROL, //�䱶+
//    PTZ_ZOOM_DEC_CONTROL, //�䱶-
//    PTZ_FOCUS_ADD_CONTROL, //����+
//    PTZ_FOCUS_DEC_CONTROL, //����-
//    PTZ_APERTURE_ADD_CONTROL, //��Ȧ+
//    PTZ_APERTURE_DEC_CONTROL, //��Ȧ-
//    PTZ_POINT_MOVE_CONTROL, //ת��Ԥ�õ�
//    PTZ_POINT_SET_CONTROL, //����
//    PTZ_POINT_DEL_CONTROL, //ɾ��
//    PTZ_POINT_LOOP_CONTROL, //�����ѭ
//    PTZ_LAMP_CONTROL //�ƹ���ˢ
//    );
type
 //��̨������չ����
  EXTPTZ_ControlType = (
    EXTPTZ_LEFTTOP = $20, //����
    EXTPTZ_RIGHTTOP, //����
    EXTPTZ_LEFTDOWN, //����
    EXTPTZ_RIGHTDOWN, //����
    EXTPTZ_ADDTOLOOP, //����Ԥ�õ㵽Ѳ��	Ѳ����·	Ԥ�õ�ֵ
    EXTPTZ_DELFROMLOOP, //ɾ��Ѳ����Ԥ�õ�	Ѳ����·	Ԥ�õ�ֵ
    EXTPTZ_CLOSELOOP, //���Ѳ��	Ѳ����·
    EXTPTZ_STARTPANCRUISE, //��ʼˮƽ��ת
    EXTPTZ_STOPPANCRUISE, //ֹͣˮƽ��ת
    EXTPTZ_SETLEFTBORDER, //������߽�
    EXTPTZ_RIGHTBORDER, //�����ұ߽�
    EXTPTZ_STARTLINESCAN, //��ʼ��ɨ
    EXTPTZ_CLOSELINESCAN, //ֹͣ��ɨ
    EXTPTZ_SETMODESTART, //����ģʽ��ʼ	ģʽ��·
    EXTPTZ_SETMODESTOP, //����ģʽ����	ģʽ��·
    EXTPTZ_RUNMODE, //����ģʽ	ģʽ��·
    EXTPTZ_STOPMODE, //ֹͣģʽ	ģʽ��·
    EXTPTZ_DELETEMODE, //���ģʽ	ģʽ��·
    EXTPTZ_REVERSECOMM, //��ת����
    EXTPTZ_FASTGOTO, //���ٶ�λ	ˮƽ����	��ֱ����	�䱶
    EXTPTZ_AUXIOPEN, //x34	�������ؿ�	������
    EXTPTZ_AUXICLOSE, //0x35	�������ع�	������
    EXTPTZ_OPENMENU = $36, //������˵�
    EXTPTZ_CLOSEMENU, //�رղ˵�
    EXTPTZ_MENUOK, //�˵�ȷ��
    EXTPTZ_MENUCANCEL, //�˵�ȡ��
    EXTPTZ_MENUUP, //�˵���
    EXTPTZ_MENUDOWN, //�˵���
    EXTPTZ_MENULEFT, //�˵���
    EXTPTZ_MENURIGHT, //�˵���
    EXTPTZ_TOTAL //�������ֵ
    );

//IO��������
  IOTYPE = (
    ALARMINPUT = 1, //��������
    ALARMOUTPUT = 2 //�������
    );


const _EC = $80000000;

//*�������ʹ��ţ�����GetLastError�����ķ���*/
const NET_NOERROR = 0; //û�д���
const NET_ERROR = -1; //δ֪����
const NET_SYSTEM_ERROR = _EC or 1; //Windowsϵͳ����
const NET_NETWORK_ERROR = _EC or 2; //�������
const NET_DEV_VER_NOMATCH = _EC or 3; //�豸Э�鲻ƥ��
const NET_INVALID_HANDLE = _EC or 4; //�����Ч
const NET_OPEN_CHANNEL_ERROR = _EC or 5; //��ͨ��ʧ��
const NET_CLOSE_CHANNEL_ERROR = _EC or 6; //�ر�ͨ��ʧ��
const NET_ILLEGAL_PARAM = _EC or 7; //�û��������Ϸ�
const NET_SDK_INIT_ERROR = _EC or 8; //SDK��ʼ������
const NET_SDK_UNINIT_ERROR = _EC or 9; //SDK�������
const NET_RENDER_OPEN_ERROR = _EC or 10; //����render��Դ����
const NET_DEC_OPEN_ERROR = _EC or 11; //�򿪽�������
const NET_DEC_CLOSE_ERROR = _EC or 12; //�رս�������
const NET_MULTIPLAY_NOCHANNEL = _EC or 13; //�໭��Ԥ���м�⵽ͨ����Ϊ0
const NET_TALK_INIT_ERROR = _EC or 14; //¼�����ʼ��ʧ��
const NET_TALK_NOT_INIT = _EC or 15; //¼����δ����ʼ��
const NET_TALK_SENDDATA_ERROR = _EC or 16; //������Ƶ���ݳ���
const NET_REAL_ALREADY_SAVING = _EC or 17; //ʵʱ�����Ѿ����ڱ���״̬
const NET_NOT_SAVING = _EC or 18; //δ����ʵʱ����
const NET_OPEN_FILE_ERROR = _EC or 19; //���ļ�����
const NET_PTZ_SET_TIMER_ERROR = _EC or 20; //������̨���ƶ�ʱ��ʧ��
const NET_RETURN_DATA_ERROR = _EC or 21; //�Է������ݵ�У�����
const NET_INSUFFICIENT_BUFFER = _EC or 22; //û���㹻�Ļ���
const NET_NOT_SUPPORTED = _EC or 23; //��ǰSDKδ֧�ָù���
const NET_NO_RECORD_FOUND = _EC or 24; //��ѯ����¼��
const NET_NOT_AUTHORIZED = _EC or 25; //�޲���Ȩ��
const NET_NOT_NOW = _EC or 26; //��ʱ�޷�ִ��
const NET_NO_TALK_CHANNEL = _EC or 27; //δ���ֶԽ�ͨ��
const NET_NO_AUDIO = _EC or 28; //δ������Ƶ
const NET_NO_INIT = _EC or 29; //CLientSDKδ����ʼ��
const NET_DOWNLOAD_END = _EC or 30; //�����ѽ���


const NET_LOGIN_ERROR_PASSWORD = _EC or 100; //���벻��ȷ
const NET_LOGIN_ERROR_USER = _EC or 101; //�ʻ�������
const NET_LOGIN_ERROR_TIMEOUT = _EC or 102; //�ȴ���¼���س�ʱ
const NET_LOGIN_ERROR_RELOGGIN = _EC or 103; //�ʺ��ѵ�¼
const NET_LOGIN_ERROR_LOCKED = _EC or 104; //�ʺ��ѱ�����
const NET_LOGIN_ERROR_BLACKLIST = _EC or 105; //�ʺ��ѱ���Ϊ������
const NET_LOGIN_ERROR_BUSY = _EC or 106; //��Դ���㣬ϵͳæ
const NET_LOGIN_ERROR_CONNECT = _EC or 107; //��������ʧ��"
const NET_LOGIN_ERROR_NETWORK = _EC or 108; //��������ʧ��"

const NET_RENDER_SOUND_ON_ERROR = _EC or 120; //Render�����Ƶ����
const NET_RENDER_SOUND_OFF_ERROR = _EC or 121; //Render��ر���Ƶ����
const NET_RENDER_SET_VOLUME_ERROR = _EC or 122; //Render�������������
const NET_RENDER_ADJUST_ERROR = _EC or 123; //Render�����û����������
const NET_RENDER_PAUSE_ERROR = _EC or 124; //Render����ͣ���ų���
const NET_RENDER_SNAP_ERROR = _EC or 125; //Render��ץͼ����
const NET_RENDER_STEP_ERROR = _EC or 126; //Render�ⲽ������
const NET_RENDER_FRAMERATE_ERROR = _EC or 127; //Render������֡�ʳ���

const NET_CONFIG_DEVBUSY = _EC or 999; //��ʱ�޷�����
const NET_CONFIG_DATAILLEGAL = _EC or 1000; //�������ݲ��Ϸ�

//�ص���������
const COMM_ALARM = $1100; //������Ϣ

//************************************************************************
// ** �豸�ͺ�(DVR���� );
// ***********************************************************************/

const DVR_NONREALTIME_MACE = 1; //*!< ��ʵʱMACE */
const DVR_NONREALTIME = 2; //!< ��ʵʱ */
const NVS_MPEG1 = 3; //!< ������Ƶ������ */
const DVR_MPEG1_2 = 4; //!< MPEG1��·¼��� */
const DVR_MPEG1_8 = 5; //!< MPEG1��·¼��� */
const DVR_8 = 6; //!< һ����·¼��� */
const DVR_16 = 7; //!< һ��ʮ��·¼��� */
const DVR_SX2 = 8; //!< ��������ʮ��·¼��� */
const DVR_ST2 = 9; //!< ������ͨ¼��� */
const DVR_SH2 = 10; //!< �����Ӻ�¼��� */
const DVR_GBE = 11; //!< ������ͨ������ǿ��¼��� */
const DVR_STD_NEW = 12; //!< �±�׼����Э�� */


//************************************************************************
// ** ��������
// ***********************************************************************/
const SERIALNO_LEN = 48;
const MAX_DISKNUM = 32;
const MAX_LINK = 6;
const MAX_CHANNUM = 16;
const MAX_ALARMIN = 128;
const MAX_ALARMOUT = 64;


//************************************************************************
// ** �豸��Ϣ
// ***********************************************************************/
type

  LPNET_DEVICEINFO = ^NET_DEVICEINFO;
  NET_DEVICEINFO = record
    sSerialNumber: array[0..SERIALNO_LEN - 1] of BYTE; //���к�
    byAlarmInPortNum: BYTE; //DVR�����������
    byAlarmOutPortNum: BYTE; //DVR�����������
    byDiskNum: BYTE; //DVR Ӳ�̸���
    byDVRType: BYTE; //DVR����,
    byChanNum: BYTE; //DVR ͨ������
  end;

// ************************************************************************
// ** �����ϴ���Ϣ
// ***********************************************************************/

  LPNET_CLIENT_STATE = ^NET_CLIENT_STATE;
  NET_CLIENT_STATE = record
    channelcount: integer;
    alarminputcount: integer;
    diskerror: array[0..MAX_DISKNUM - 1] of byte;
    //?? unsigned char *record;          //size:channelcount
    //?? unsigned char *alarm;           //size:alarminputcount
    //?? unsigned char *motiondection;   //size:channelcount
    //?? unsigned char *videolost;       //size:channelcount
  end;

//************************************************************************
// ** ��ѯ�豸����״̬ͨ����Ϣ:�����豸֧��
// ***********************************************************************/
  LPNET_DEV_CHANNELSTATE = ^NET_DEV_CHANNELSTATE;
  NET_DEV_CHANNELSTATE = record
    byRecordStatic: BYTE; //ͨ���Ƿ���¼��,0-��¼��,1-¼��
    bySignalStatic: BYTE; //���ӵ��ź�״̬,0-����,1-�źŶ�ʧ
    byHardwareStatic: BYTE; //ͨ��Ӳ��״̬,0-����,1-�쳣,����DSP����
    reserve: char;
    dwBitRate: DWORD; //ʵ������
    dwLinkNum: DWORD; //�ͻ������ӵĸ���
    dwClientIP: array[0..MAX_LINK - 1] of DWORD; //�ͻ��˵�IP��ַ
  end;

//************************************************************************
// ** ��ѯ�豸����״̬Ӳ����Ϣ:�����豸��֧��
// ***********************************************************************/
  LPNET_DEV_DISKSTATE = ^NET_DEV_DISKSTATE;
  NET_DEV_DISKSTATE = record
    dwVolume: DWORD; //Ӳ�̵�����
    dwFreeSpace: DWORD; //Ӳ�̵�ʣ��ռ�
    dwStatus: DWORD; //Ӳ�̵�״̬,����,�,��������
  end;

//************************************************************************
// ** ��ѯ�豸����״̬
// ***********************************************************************/
  LPNET_DEV_WORKSTATE = ^NET_DEV_WORKSTATE;
  NET_DEV_WORKSTATE = record
    dwDeviceStatic: DWORD; //�豸��״̬,0x00 ����,0x01 CPUռ�ù���,0x02 Ӳ������
    stHardDiskStatic: array[0..MAX_DISKNUM - 1] of NET_DEV_DISKSTATE;
    stChanStatic: array[0..MAX_CHANNUM - 1] of NET_DEV_CHANNELSTATE; //ͨ����״̬
    byAlarmInStatic: array[0..MAX_ALARMIN - 1] of BYTE; //�����˿ڵ�״̬,0-û�б���,1-�б���
    byAlarmOutStatic: array[0..MAX_ALARMOUT - 1] of BYTE; //��������˿ڵ�״̬,0-û�����,1-�б������
    dwLocalDisplay: DWORD; //������ʾ״̬,0-����,1-������
  end;

//************************************************************************
// ** ʱ��
// ***********************************************************************/
  LPNET_TIME = ^NET_TIME;
  NET_TIME = record
    dwYear: DWORD; //��
    dwMonth: DWORD; //��
    dwDay: DWORD; //��
    dwHour: DWORD; //ʱ
    dwMinute: DWORD; //��
    dwSecond: DWORD; //��
  end;

//************************************************************************
// ** ¼���ļ���Ϣ
// ***********************************************************************/
  LPNET_RECORDFILE_INFO = ^NET_RECORDFILE_INFO;
  NET_RECORDFILE_INFO = record
    ch: DWord; //ͨ����
    filename: char_128; //�ļ���
    size: Dword; //�ļ�����
    starttime: NET_TIME; //��ʼʱ��
    endtime: NET_TIME; //����ʱ��
    driveno: dword; //���̺�
    startcluster: dword; //��ʼ�غ�
    nRecordFileType: Byte; // 0 ��ͨ¼��  1 ����¼��  2 �ƶ���� 3 ����¼�� 4 ͼƬ
    bImportantRecID: Byte; //0 ��ͨ¼�� 1 ��Ҫ¼��
    bHint: BYTE; //�ļ���λ����
    bReserved: BYTE; //����
  end;



//************************************************************************
// ** Э����Ϣ
// ***********************************************************************/
  LPPROTOCOL_INFO = ^PROTOCOL_INFO;
  PROTOCOL_INFO = record
    protocolname: char_12; //Э����
    baudbase: dword; //������
    databits: byte; //����λ
    stopbits: byte; //ֹͣλ
    parity: byte; //У��λ
    reserve: byte;
  end;

//************************************************************************
// ** ����IO����
//***********************************************************************/

  LPALARM_CONTROL = ^ALARM_CONTROL;
  ALARM_CONTROL = record
    index: UShort; //�˿����
    state: UShort; //�˿�״̬
  end;

//************************************************************************
// ** �������Ͽ��ص�ԭ��
// ***********************************************************************/
  PfDisConnect = ^TfDisConnect;
  TfDisConnect = procedure(lLoginID: LONG; pchDVRIP: Pchar; nDVRPort: LONG; dwUser: DWORD) of object; stdcall;
//************************************************************************
// ** ʵʱԤ���ص�ԭ��
// ***********************************************************************/
  PfRealDataCallBack = ^TfRealDataCallBack;
  TfRealDataCallBack = procedure(lRealHandle: LONG; dwDataType: DWORD; pBuffer: PBYTE; dwBufSize, dwUser: DWORD) of object; stdcall;
//************************************************************************
// ** ԭʼ���ݻص�ԭ��
// ***********************************************************************/
  PfDataCallBack = ^TfDataCallBack;
  TfDataCallBack = procedure(lRealHandle: LONG; dwDataType: DWORD; pBuffer: PBYTE; dwBufSize, dwUser: DWORD) of object; stdcall;

//************************************************************************
// ** �ص�ԭ��
// ***********************************************************************/
  PfMessCallBack = ^TfMessCallBack;
  TfMessCallBack = procedure(lCommand: LONG; lLoginID: LONG; pBuf: Pchar;
    dwBufLen: DWORD; pchDVRIP: Pchar; nDVRPort: LONG; dwUser: DWORD) of object; stdcall;
//************************************************************************
// ** ��Ļ���ӻص�ԭ��
// ***********************************************************************/
  PfDrawCallBack = ^TfDrawCallBack;
  TfDrawCallBack = procedure(lLoginID, lPlayHandle: LONG; DC: HDC; dwUser: DWORD) of object; stdcall;

//************************************************************************
// ** ʵʱԤ���ص�ԭ��-��չ
// ***********************************************************************/
  PfRealDataCallBackEx = ^TfRealDataCallBackEx;
  TfRealDataCallBackEx = procedure(lRealHandle: LONG; dwDataType: DWORD; pBuffer: PBYTE; dwBufSize: DWORD; param: LONG; dwUser: DWORD) of object; stdcall;



type
  EM_REALPLAY_DISCONNECT_EVENT_TYPE=(
  DISCONNECT_EVENT_REAVE =0,     //��ʾ�߼��û���ռ�ͼ��û���Դ
  DISCONNECT_EVENT_NETFORBID ,//��ֹ����
 DISCONNECT_EVENT_SUBCONNECT //��̬�����ӶϿ�
 );

 type
 
  PfRealPlayDisConnect = ^TfRealPlayDisConnect;
  TfRealPlayDisConnect = procedure(lOperateHandle: LONG; dwEventType: EM_REALPLAY_DISCONNECT_EVENT_TYPE; param : Pointer; dwUser: DWORD) of object; stdcall;


//  typedef void (CALLBACK *fRealPlayDisConnect)(
//  LLONG  lOperateHandle,
//  EM_REALPLAY_DISCONNECT_EVENT_TYPE  dwEventType,
//  void*   param,
//  LDWORD dwUser
//);


//************************************************************************
// ** �ط�¼����Ȼص�ԭ��
// ***********************************************************************/

  PfDownLoadPosCallBack = ^TfDownLoadPosCallBack;
  TfDownLoadPosCallBack = procedure(lPlayHandle: LONG; dwTotalSize, dwDownLoadSize, dwUser: DWORD) of object; stdcall;

//************************************************************************
// ** ͨ��ʱ������¼����Ȼص�ԭ��
// ���ڰ�ʱ������û��ʹ������ص�������ʹ�õ��ǻط�¼����Ȼص�ԭ��. //by linjianyan
// ***********************************************************************/
  PfTimeDownLoadPosCallBack = ^TfTimeDownLoadPosCallBack;
  TfTimeDownLoadPosCallBack = procedure(lPlayHandle: LONG; dwTotalSize, dwDownLoadSize: DWORD; index: int; recordfileinfo: NET_RECORDFILE_INFO; dwUser: DWORD) of object; stdcall;

//************************************************************************
// ** ��ѯ�豸��־���ݻص�ԭ��
// ***********************************************************************/
  PfLogDataCallBack = ^TfLogDataCallBack;
  TfLogDataCallBack = procedure(lLoginID: LONG; pBuffer: Pchar; dwBufSize, nTotalSize: DWORD; bEnd: bool; dwUser: DWORD) of object; stdcall;

///************************************************************************
// ** ͸�����ڻص�ԭ��
// ***********************************************************************/
  PfTransComCallBack = ^TfTransComCallBack;
  TfTransComCallBack = procedure(lLoginID, lTransComChannel: LONG; pBuffer: Pchar; dwBufSize, dwUser: DWORD) of object; stdcall;

//************************************************************************
// ** �����豸����ص�ԭ��
// ***********************************************************************/
  PfUpgradeCallBack = ^TfUpgradeCallBack;
  TfUpgradeCallBack = procedure(lLoginID: LONG; lUpgradechannel: LONG; nTotalSize, nSendSize: int; dwUser: DWORD) of object; stdcall;


//************************************************************************
// ** SDK��ʼ��
// ***********************************************************************/
function CLIENT_Init(cbDisConnect: PfDisConnect; dwUser: DWORD): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_Init';

//************************************************************************
// ** SDK�˳�����
// ***********************************************************************/
procedure CLIENT_Cleanup(); stdcall; external DHNetSDK_API name 'CLIENT_Cleanup';

//************************************************************************/
//* ���غ���ִ��ʧ�ܴ���                                                                  */
//************************************************************************/
function CLIENT_GetLastError(): DWORD; stdcall; external DHNetSDK_API name 'CLIENT_GetLastError';

//************************************************************************
// ** �������ӷ�������ʱʱ��ͳ��Դ���
// ***********************************************************************/
procedure CLIENT_SetConnectTime(nWaitTime, nTryTimes: int); stdcall; external DHNetSDK_API name 'CLIENT_SetConnectTime';


//************************************************************************
// ** ��ȡSDK�İ汾��Ϣ
// ***********************************************************************/
function CLIENT_GetSDKVersion(): DWORD; stdcall; external DHNetSDK_API name 'CLIENT_GetSDKVersion';

//************************************************************************
// ** ���豸ע��
// ***********************************************************************/
function CLIENT_Login(pchDVRIP: Pchar; wDVRPort: WORD; pchUserName, pchPassword: Pchar; lpDeviceInfo: LPNET_DEVICEINFO; var error: integer): LONG; stdcall; external DHNetSDK_API name 'CLIENT_Login';

function CLIENT_LoginEx(pchDVRIP: Pchar; wDVRPort: WORD; pchUserName, pchPassword: Pchar; nSpecCap: int; pCapParam: Pointer; lpDeviceInfo: LPNET_DEVICEINFO; var error: integer): LONG; stdcall; external DHNetSDK_API name 'CLIENT_LoginEx';

//************************************************************************
// ** ���豸ע��
// ***********************************************************************/
function CLIENT_Logout(lLoginID: LONG): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_Logout';

//************************************************************************
// **
// ***********************************************************************/
procedure CLIENT_SetDVRMessCallBack(cbMessage: PfMessCallBack; dwUser: DWORD); stdcall; external DHNetSDK_API name 'CLIENT_SetDVRMessCallBack';


//************************************************************************
// ** ��ʼ֡���豸
// ***********************************************************************/
function CLIENT_StartListen(lLoginID: LONG): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_StartListen';


//************************************************************************
// ** ֹͣ֡���豸
// ***********************************************************************/
function CLIENT_StopListen(lLoginID: LONG): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_StopListen';


//************************************************************************
// ** ������Ļ���ӻص�
// ***********************************************************************/
procedure CLIENT_RigisterDrawFun(cbDraw: PfDrawCallBack; dwUser: DWORD); stdcall; external DHNetSDK_API name 'CLIENT_RigisterDrawFun';


//************************************************************************
// ** ��ʼʵʱԤ��
// ***********************************************************************/
function CLIENT_RealPlay(lLoginID: LONG; nChannelID: int; hWnd: HWND): LONG; stdcall; external DHNetSDK_API name 'CLIENT_RealPlay';



//************************************************************************
// ** ��ʼʵʱԤ��_��չ
// ***********************************************************************/
//ʵʱԤ����չ�ӿ����ӵĲ�����Ԥ������
type

  RealPlayType = (
    DH_RType_RealPlay  = 0, //ʵʱԤ��
    DH_RType_Multiplay, //�໭��Ԥ��
    DH_RType_RealPlay_0,//ʵʱ����-����������ͬ��DH_RType_Realplay
    DH_RType_RealPlay_1,//ʵʱ����-������1
    DH_RType_RealPlay_2,// ʵʱ����-������2
    DH_RType_RealPlay_3,// ʵʱ����-������3
    DH_RType_Multiplay_1,// �໭��Ԥ����1����
    DH_RType_Multiplay_4,// �໭��Ԥ����4����
    DH_RType_Multiplay_8,// �໭��Ԥ����8����
    DH_RType_Multiplay_9,// �໭��Ԥ����9����
    DH_RType_Multiplay_16,// �໭��Ԥ����16����
    DH_RType_Multiplay_6,// �໭��Ԥ����6����
    DH_RType_Multiplay_12// �໭��Ԥ����12����

    );




function CLIENT_RealPlayEx(lLoginID: LONG; nChannelID: int; hWnd: HWND; rType: RealPlayType = DH_RType_RealPlay): LONG; stdcall; external DHNetSDK_API name 'CLIENT_RealPlayEx';

function CLIENT_StartRealPlay(lLoginID: LONG; nChannelID: int; hWnd: HWND; rType: RealPlayType;fRealDataCallBackEx :PfRealDataCallBackEx; fRealPlayDisConnect :PfRealPlayDisConnect;dwUser:PDWORD; dwWaitTime:DWORD=1000  ): LONG; stdcall; external DHNetSDK_API name 'CLIENT_StartRealPlay';


///***********************************************************************
// ** ֹͣʵʱԤ��
// ***********************************************************************/
function CLIENT_StopRealPlay(lRealHandle: LONG): bool; stdcall; external DHNetSDK_API name 'CLIENT_StopRealPlay';

///***********************************************************************
// ** ֹͣʵʱԤ��_��չ
// ***********************************************************************/
function CLIENT_StopRealPlayEx(lRealHandle: LONG): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_StopRealPlayEx';

//***********************************************************************
/// ��������Ϊ�ļ�
///*********************************************************************/
function CLIENT_SaveRealData(lRealHandle: LONG; const pchFileName: Pchar): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_SaveRealData';

//***********************************************************************
/// ������������Ϊ�ļ�
///*********************************************************************/
function CLIENT_StopSaveRealData(lRealHandle: LONG): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_StopSaveRealData';


//***********************************************************************
/// ����ͼ������
///*********************************************************************/
function CLIENT_ClientSetVideoEffect(lPlayHandle: LONG; nBrightness, nContrast, nHue, nSaturation: byte): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_ClientSetVideoEffect';


//***********************************************************************
/// ��ȡͼ������
///*********************************************************************/
function CLIENT_ClientGetVideoEffect(lPlayHandle: LONG; nBrightness, nContrast, nHue, nSaturation: Pbyte): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_ClientGetVideoEffect';

//***********************************************************************
// ������
//*********************************************************************/
function CLIENT_OpenSound(lPlayHandle: LONG): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_OpenSound';
//***********************************************************************
/// �ر�����
///*********************************************************************/
function CLIENT_CloseSound(): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_CloseSound';

//***********************************************************************
/// ��������
///*********************************************************************/
function CLIENT_SetVolume(lPlayHandle: LONG; nVolume: int): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_SetVolume';

type

  LPtagVideoFrameParam = ^tagVideoFrameParam;
  tagVideoFrameParam = record
    encode: BYTE; //��������
    frametype: BYTE; //I = 0, P = 1, B = 2...
    format: BYTE; //PAL - 0, NTSC - 1
    size: BYTE; //CIF - 0, HD1 - 1, 2CIF - 2, D1 - 3, VGA - 4, QCIF - 5, QVGA - 6
    fourcc: DWORD; //�����H264��������Ϊ0��MPEG4����������дFOURCC('X','V','I','D');
    reserved: DWORD; //����
    struTime: NET_TIME; //ʱ����Ϣ
  end;

  LPtagCBPCMDataParam = ^tagCBPCMDataParam;
  tagCBPCMDataParam = record
    channels: BYTE; // ������
    samples: BYTE; // ���� 0 - 8000, 1 - 11025, 2 - 16000, 3 - 22050, 4 - 32000, 5 - 44100, 6 - 48000
    depth: BYTE; // ������� ȡֵ8����16�ȡ�ֱ�ӱ�ʾ
    param1: BYTE; // 0 - ָʾ�޷��ţ�1-ָʾ�з���
    reserved: DWORD; // ����
  end;
//***********************************************************************
/// ����ʵʱԤ���ص�
///*********************************************************************/
function CLIENT_SetRealDataCallBack(lRealHandle: LONG; cbRealData: PfRealDataCallBack; dwUser: DWORD): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_SetRealDataCallBack';



//***********************************************************************
/// ����ʵʱԤ���ص�-��չ
///*********************************************************************/
function CLIENT_SetRealDataCallBackEx(lRealHandle: LONG; cbRealData: PfRealDataCallBackEx; dwUser, dwFlag: DWORD): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_SetRealDataCallBackEx';
//***********************************************************************
/// ץͼ
///*********************************************************************/
function CLIENT_CapturePicture(hPlayHandle: LONG; const pchPicFileName: Pchar): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_CapturePicture';


//***********************************************************************
/// ͨ��ʱ���ѯ¼���ļ�
///*********************************************************************/
function CLIENT_QueryRecordFile(lLoginID: LONG; nChannelId, nRecordFileType: int; tmStart, tmEnd: LPNET_TIME; pchCardid: Pchar; nriFileinfo: LPNET_RECORDFILE_INFO; maxlen: int; var filecount; waittime: int = 1500; bTime: bool = false): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_QueryRecordFile';


//***********************************************************************
/// �ط�¼���ļ�
///*********************************************************************/
function CLIENT_PlayBackByRecordFile(lLoginID: LONG; lpRecordFile: LPNET_RECORDFILE_INFO; hWnd: HWND; cbDownLoadPos: PfDownLoadPosCallBack; dwUserData: DWORD): Long; stdcall; external DHNetSDK_API name 'CLIENT_PlayBackByRecordFile';

//***********************************************************************
/// �ط�¼���ļ���չ_���������ݻص�����
///*********************************************************************/
function CLIENT_PlayBackByRecordFileEx(lLoginID: LONG; lpRecordFile: LPNET_RECORDFILE_INFO; hWnd: HWND; cbDownLoadPos: PfDownLoadPosCallBack; dwPosUser: DWORD; fDownLoadDataCallBack: PfDataCallBack; dwDataUser: DWORD): Long; stdcall; external DHNetSDK_API name 'CLIENT_PlayBackByRecordFileEx';

//***********************************************************************
/// ��ͣ¼��ط�
///*********************************************************************/
function CLIENT_PausePlayBack(lPlayHandle: LONG; bPause: BOOL): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_PausePlayBack';


//***********************************************************************
/// ��λ¼��ط���ʼ��
///*********************************************************************/
function CLIENT_SeekPlayBack(lPlayHandle: LONG; offsettime, offsetbyte: uint): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_SeekPlayBack';


//***********************************************************************
/// ֹͣ¼��ط�
///*********************************************************************/
function CLIENT_StopPlayBack(lPlayHandle: LONG): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_StopPlayBack';


function CLIENT_NormalPlayBack(lPlayHandle: LONG): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_NormalPlayBack';

//***********************************************************************
/// ����¼��ط�
///*********************************************************************/
function CLIENT_StepPlayBack(lPlayHandle: LONG; bStop: bool): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_StepPlayBack';


//***********************************************************************
/// ���¼��ط�
///*********************************************************************/
function CLIENT_FastPlayBack(lPlayHandle: LONG): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_FastPlayBack';


//***********************************************************************
/// ����¼��ط�
///*********************************************************************/
function CLIENT_SlowPlayBack(lPlayHandle: LONG): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_SlowPlayBack';


//***********************************************************************
/// ���ûط�֡��
///*********************************************************************/
function CLIENT_SetFramePlayBack(lPlayHandle: LONG; framerate: int): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_SetFramePlayBack';

//***********************************************************************
/// ��ȡ�ط�֡��
///*********************************************************************/
function CLIENT_GetFramePlayBack(lPlayHandle: LONG; var fileframerate, playframerate: int): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_GetFramePlayBack';


//***********************************************************************
/// ��ȡ�ط�OSDʱ��
///*********************************************************************/
function CLIENT_GetPlayBackOsdTime(lPlayHandle: LONG; lpOsdTime, lpStartTime, lpEndTime: LPNET_TIME): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_GetPlayBackOsdTime';


//***********************************************************************
/// ����¼���ļ�
///*********************************************************************/
function CLIENT_DownloadByRecordFile(lLoginID: LONG; lpRecordFile: LPNET_RECORDFILE_INFO; sSavedFileName: Pchar; cbDownLoadPos: PfDownLoadPosCallBack; dwUserData: DWORD): Long; stdcall; external DHNetSDK_API name 'CLIENT_DownloadByRecordFile';


//***********************************************************************
/// ͨ��ʱ������¼��
///*********************************************************************/
function CLIENT_DownloadByTime(lLoginID: LONG; nChannelId, nRecordFileType: int; tmStart, tmEnd: LPNET_TIME; sSavedFileName: Pchar; cbTimeDownLoadPos: PfTimeDownLoadPosCallBack; dwUserData: DWORD): Long; stdcall; external DHNetSDK_API name 'CLIENT_DownloadByTime';


//***********************************************************************
/// ֹͣ¼������
///*********************************************************************/
function CLIENT_StopDownload(lFileHandle: LONG): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_StopDownload';


//***********************************************************************
/// ��ѯ¼�����ؽ���
///*********************************************************************/
function CLIENT_GetDownloadPos(lFileHandle: LONG; var nTotalSize, nDownLoadSize: int): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_GetDownloadPos';


//***********************************************************************
/// �໭��ʵʱԤ��
///*********************************************************************/
function CLIENT_MultiPlay(lLoginID: LONG; hWnd: HWND): Long; stdcall; external DHNetSDK_API name 'CLIENT_MultiPlay';


//***********************************************************************
/// ֹͣ�໭��ʵʱԤ��
///*********************************************************************/
function CLIENT_StopMultiPlay(lMultiHandle: LONG): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_StopMultiPlay';


//***********************************************************************
/// ��ѯϵͳ����������
/// ��ͨ����
/// COM������
/// ��������
/// ��ʱ����
/// ͼ������
/// PTZ����
/// ��̬�������
/// ��������
///*********************************************************************/
function CLIENT_QueryConfig(lLoginID: LONG; nConfigType: int; pConfigbuf: Pchar; maxlen: int; var nConfigbuflen: int; waittime: int = 15000): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_QueryConfig';


//***********************************************************************
/// ����ϵͳ����������
/// ��ͨ����
/// COM������
/// ��������
/// ��ʱ����
/// ͼ������
/// PTZ����
/// ��̬�������
/// ��������
///*********************************************************************/
function CLIENT_SetupConfig(lLoginID: LONG; nConfigType: int; pConfigbuf: Pchar; nConfigbuflen: Int; waittime: int = 15000): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_SetupConfig';


//***********************************************************************
/// ��ѯ�豸ͨ������
///*********************************************************************/
function CLIENT_QueryChannelName(lLoginID: LONG; pChannelName: Pchar; maxlen: int; var nChannelCount: int; waittime: int = 15000): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_QueryChannelName';

//***********************************************************************
/// �����豸ͨ������
///*********************************************************************/
function CLIENT_SetupChannelName(lLoginID: LONG; pbuf: Pchar; nbuflen: int): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_SetupChannelName';


//***********************************************************************
/// ͨ����̨����
///*********************************************************************/
function CLIENT_PTZControl(lLoginID: LONG; nChannelID: int; dwPTZCommand, dwStep: DWORD; dwStop: BOOL): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_PTZControl';


//***********************************************************************
/// ����̨����
///*********************************************************************/
function CLIENT_DHPTZControl(lLoginID: LONG; nChannelID: int; dwPTZCommand: DWORD;
  param1, param2, param3: byte; dwStop: BOOL): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_DHPTZControl';


//***********************************************************************
/// �첽��ѯ�豸��־
///*********************************************************************/
function CLIENT_QueryLogCallback(lLoginID: LONG; cbLogData: PfLogDataCallBack; dwUser: DWORD): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_QueryLogCallback';


//***********************************************************************
/// ͬ����ѯ�豸��־
///*********************************************************************/
function CLIENT_QueryLog(lLoginID: LONG; pLogBuffer: Pchar; maxlen: int; var nLogBufferlen: int; waittime: int = 15000): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_QueryLog';


//***********************************************************************
/// ����͸������ͨ��
///*********************************************************************/

function CLIENT_CreateTransComChannel(lLoginID: LONG; TransComType: int; baudrate, databits, stopbits, parity: uint;
  cbTransCom: PfTransComCallBack; dwUser: DWORD): LONG; stdcall; external DHNetSDK_API name 'CLIENT_CreateTransComChannel';

//***********************************************************************
/// ͸�����ڷ�������
///*********************************************************************/
function CLIENT_SendTransComData(lTransComChannel: LONG; pBuffer: Pchar; dwBufSize: DWORD): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_SendTransComData';

//***********************************************************************
/// �ͷ�ͨ������ͨ��
///*********************************************************************/
function CLIENT_DestroyTransComChannel(lTransComChannel: LONG): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_DestroyTransComChannel';


//***********************************************************************
///
///*********************************************************************/
function CLIENT_Reset(lLoginID: LONG; bReset: BOOL): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_Reset';

//***********************************************************************
/// ��ʼ�����豸����
///*********************************************************************/
function CLIENT_StartUpgrade(lLoginID: LONG; pchFileName: Pchar; cbUpgrade: PfUpgradeCallBack; dwUser: DWORD): LONG; stdcall; external DHNetSDK_API name 'CLIENT_StartUpgrade';


//***********************************************************************
/// ��������
///*********************************************************************/
function CLIENT_SendUpgrade(lUpgradeID: LONG): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_SendUpgrade';


//***********************************************************************
/// ���������豸����
///*********************************************************************/
function CLIENT_StopUpgrade(lUpgradeID: LONG): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_StopUpgrade';


//***********************************************************************
/// ���ͨ��¼��״̬
///*********************************************************************/
function CLIENT_QueryRecordState(lLoginID: LONG; pRSBuffer: Pchar; maxlen: int; var nRSBufferlen: int; waittime: int = 15000): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_QueryRecordState';


//***********************************************************************
/// ����ͨ��¼��״̬
///*********************************************************************/
function CLIENT_SetupRecordState(lLoginID: LONG; pRSBuffer: Pchar; nRSBufferlen: int): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_SetupRecordState';


//***********************************************************************
/// ��ѯ�豸��ǰʱ��
///*********************************************************************/
function CLIENT_QueryDeviceTime(lLoginID: LONG; pDeviceTime: LPNET_TIME; waittime: int = 15000): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_QueryDeviceTime';


//***********************************************************************
/// �����豸��ǰʱ��
///*********************************************************************/
function CLIENT_SetupDeviceTime(lLoginID: LONG; pDeviceTime: LPNET_TIME): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_SetupDeviceTime';


//***********************************************************************
/// ��ѯ����Э��
///*********************************************************************/
function CLIENT_QueryComProtocol(lLoginID: LONG; nProtocolType: int; pProtocolBuffer: Pchar; maxlen: int; var nProtocollen: int; waittime: int = 15000): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_QueryComProtocol';


//***********************************************************************
/// ��ѯϵͳ��Ϣ
///*********************************************************************/
function CLIENT_QuerySystemInfo(lLoginID: LONG; nSystemType: int; pSysInfoBuffer: Pchar; maxlen: int; var nSysInfolen: int; waittime: int = 15000): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_QuerySystemInfo';


//***********************************************************************
/// ��ѯ�豸�û�
///*********************************************************************/
function CLIENT_QueryUserInfo(lLoginID: LONG; nUserType: int; pUserInfoBuffer: Pchar; maxlen: int; var nUserInfolen: int; waittime: int = 15000): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_QueryUserInfo';


//***********************************************************************
/// �����豸�û�
///*********************************************************************/
function CLIENT_OperateUserInfo(lLoginID: LONG; nOperateType: int; pOperateBuffer: Pchar; nOpreateInfolen: int; waittime: int = 15000): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_OperateUserInfo';


//***********************************************************************
/// ��ʼ�Խ�
///*********************************************************************/
function CLIENT_StartTalk(lRealHandle: LONG; bCustomSend: bool = false): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_StartTalk';


//***********************************************************************
/// �����Խ�
///*********************************************************************/
function CLIENT_StopTalk(lRealHandle: LONG): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_StopTalk';


//***********************************************************************
/// �����Զ���Խ�����
///*********************************************************************/
function CLIENT_SendTalkData_Custom(lRealHandle: LONG; pBuffer: Pchar; dwBufSize: DWORD): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_SendTalkData_Custom';


//***********************************************************************
/// ��ȡͨ������
///*********************************************************************/
function CLIENT_GetStatiscFlux(lLoginID: LONG; lPlayHandle: LONG): LONG; stdcall; external DHNetSDK_API name 'CLIENT_GetStatiscFlux';


//***********************************************************************
/// ��ѯIO״̬
///*********************************************************************/
function CLIENT_QueryIOControlState(lLoginID: LONG; emType: IOTYPE;
  pState: pointer; maxlen: int; var nIOCount: int; waittime: int = 15000): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_QueryIOControlState';


//***********************************************************************
/// IO����
///*********************************************************************/
function CLIENT_IOControl(lLoginID: LONG; emType: IOTYPE; pState: Pointer; maxlen: int): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_IOControl';

//add by zhaojs 2006/08/16

//***********************************************************************
/// ��ѯ�豸����״̬
///*********************************************************************/
function CLIENT_GetDEVWorkState(lLoginID: LONG; lpWorkState: LPNET_DEV_WORKSTATE; waittime: int = 15000): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_GetDEVWorkState';


//***********************************************************************
/// ǿ��I֡
///*********************************************************************/
function CLIENT_MakeKeyFrame(lLoginID: LONG; nChannelID: int; nSubChannel: int = 0): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_MakeKeyFrame';


//***********************************************************************
/// �����豸��������
///*********************************************************************/
function CLIENT_SetMaxFlux(lLoginID: LONG; wFlux: WORD): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_SetMaxFlux';


//Ҫ�¼ӵ�,δʵ��


//***********************************************************************
/// ͨ���豸���ֻ����豸���к���DDNS��������ѯ�豸IP
///*********************************************************************/
function CLIENT_GetDVRIPByResolveSvr(pchDVRIP: Pchar; wDVRPort: WORD;
  sDVRName: Pchar; wDVRNameLen: WORD;
  sDVRSerialNumber: Pchar; wDVRSerialLen: WORD;
  sGetIP: Pchar): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_GetDVRIPByResolveSvr';

//***********************************************************************
/// ����ʵʱԤ�������С
///*********************************************************************/
function CLIENT_SetPlayerBufNumber(lRealHandle: LONG; dwBufNum: DWORD): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_SetPlayerBufNumber';


//***********************************************************************
/// ͨ��ʱ��ط�¼��
///*********************************************************************/
function CLIENT_PlayBackByTime(lLoginID: LONG; nChannelID: int;
  lpStartTime, lpStopTime: LPNET_TIME; hWnd: HWND; cbDownLoadPos: PfDownLoadPosCallBack; dwPosUser: DWORD): LONG; stdcall; external DHNetSDK_API name 'CLIENT_PlayBackByTime';

//***********************************************************************
/// ͨ��ʱ��ط�¼����չ_���������ݻص�����
///*********************************************************************/
function CLIENT_PlayBackByTimeEx(lLoginID: LONG; nChannelID: int;
  lpStartTime, lpStopTime: LPNET_TIME; hWnd: HWND; cbDownLoadPos: PfDownLoadPosCallBack; dwPosUser: DWORD;
  fDownLoadDataCallBack: PfDataCallBack; dwDataUser: DWORD): LONG; stdcall; external DHNetSDK_API name 'CLIENT_PlayBackByTimeEx';

//***********************************************************************
/// ͨ��ʱ�������ļ�
///*********************************************************************/
function CLIENT_GetFileByTime(lLoginID: LONG; nChannelID: int;
  lpStartTime, lpStopTime: LPNET_TIME; sSavedFileName: Pchar): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_GetFileByTime';

//***********************************************************************
/// ����طſ���
///*********************************************************************/
function CLIENT_PlayBackControl(lPlayHandle: LONG;
  dwControlCode, dwInValue: DWORD; var lpOutValue: DWORD): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_PlayBackControl';

//***********************************************************************
/// ��ʼ����¼���ļ�
///*********************************************************************/
function CLIENT_FindFile(lLoginID: LONG; nChannelId: int; nRecordFileType: int; cardid: Pchar; time_start, time_end: LPNET_TIME;
  bTime: bool; waittime: int): LONG; stdcall; external DHNetSDK_API name 'CLIENT_FindFile';
//***********************************************************************
/// ����¼���ļ�
///*********************************************************************/
function CLIENT_FindNextFile(lFindHandle: LONG; lpFindData: LPNET_RECORDFILE_INFO): int; stdcall; external DHNetSDK_API name 'CLIENT_FindNextFile';


//***********************************************************************
/// ����¼���ļ�����
///*********************************************************************/
function CLIENT_FindClose(lFindHandle: LONG): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_FindClose';


//***********************************************************************
/// �����豸������ֵ TRUE �ɹ��� FALSE ʧ��
///*********************************************************************/
function CLIENT_RebootDev(lLoginID: LONG): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_RebootDev';


//***********************************************************************
/// �ر��豸������ֵ TRUE �ɹ��� FALSE ʧ��
///*********************************************************************/
function CLIENT_ShutDownDev(lLoginID: LONG): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_ShutDownDev';


//***********************************************************************
/// ��������
///*********************************************************************/
const NAME_LEN = 32;
const MACADDR_LEN = 6;
const MAX_ETHERNET = 2;
const PATHNAME_LEN = 128;
const PASSWD_LEN = 16;
const MAX_TIMESEGMENT = 4;
const MAX_PRESET = 128;
const MAX_DAYS = 7;
const PHONENUMBER_LEN = 32;
const MAX_WINDOW = 16;
const MAX_VGA = 1;
const MAX_USERNUM = 16;
const MAX_EXCEPTIONNUM = 16;
const MAXCARD_NUM = 40;
const MAX_SERIALNUM = 2;
const CARDNUM_LEN = 20;
const MAX_VIDEOOUT = 2;
const MAX_DISPLAY_REGION = 16;
const MAX_NAMELEN = 16;
const MAX_RIGHT = 32;
const MAX_SHELTERNUM = 4;
const MAX_DECPOOLNUM = 4;
const MAX_DECNUM = 4;
const MAX_TRANSPARENTNUM = 2;
const MAX_STRINGNUM = 4;
const MAX_AUXOUT = 4;

type

  LPNET_DEV_SCHEDTIME = ^NET_DEV_SCHEDTIME;
  NET_DEV_SCHEDTIME = record
    byStartHour: BYTE; //��ʼʱ��
    byStartMin: BYTE;
    byStopHour: BYTE; //����ʱ��
    byStopMin: BYTE;
  end;
///***********************************************************************
/// �豸ϵͳ���ýṹ
///*********************************************************************/
{
 LPNET_DEV_DEVICECFG  =  ^NET_DEV_DEVICECFG     ;
 NET_DEV_DEVICECFG   = record
     DWORD	dwSize;
     BYTE	sDVRName[NAME_LEN];		// DVR ���� ///
     DWORD	dwDVRID;			// DVR ID,����ң���� ///
     DWORD	dwRecycleRecord;		// �Ƿ�ѭ��¼��,0:����; 1:�� ///
     // ���²��ܸ���
     BYTE	sSerialNumber[SERIALNO_LEN];	// ���к� ///
     DWORD	dwSoftwareVersion;		// ����汾��,�� 16 λ�����汾,�� 16 λ�Ǵΰ汾 ///
     DWORD	dwSoftwareBuildDate;		// �����������,0xYYYYMMDD///
     DWORD	dwDSPSoftwareVersion;		// DSP ����汾,�� 16 λ�����汾,�� 16 λ�Ǵΰ汾///
     DWORD	dwDSPSoftwareBuildDate;		// DSP �����������,0xYYYYMMDD///
     DWORD	dwPanelVersion;			// ǰ���汾,�� 16 λ�����汾,�� 16 λ�Ǵΰ汾 ///
     DWORD	dwHardwareVersion;		// Ӳ���汾,�� 16 λ�����汾,�� 16 λ�Ǵΰ汾 ///
     DWORD	dwDVRType;			// DVR ����, 1:DVR 2:ATM DVR 3:DVS  �ȵ� ///
     BYTE	byAlarmInPortNum;		// DVR ����������� ///
     BYTE	byAlarmOutPortNum;		// DVR ����������� ///
     BYTE	byRS232Num;			// DVR 232  ���ڸ��� ///
     BYTE	byRS485Num;			// DVR 485  ���ڸ��� ///
     BYTE	byNetworkPortNum;		// ����ڸ��� ///
     BYTE	byDiskCtrlNum;			// DVR  Ӳ�̿��������� ///
     BYTE	byDiskNum;			// DVR  Ӳ�̸��� ///
     BYTE	byChanNum;			// DVR  ͨ������ ///
     BYTE	byStartChan;			// ��ʼͨ����,����DVS-1,DVR �C 1///
     BYTE	byDecordChans;			// DVR  ����·�� ///
     BYTE	byVGANum;			// VGA  �ڵĸ��� ///
     BYTE	byUSBNum;			// USB  �ڵĸ��� ///
 end ;

//***********************************************************************
/// �������ýṹ
///*********************************************************************/
 LPNET_DEV_ETHERNET  =  ^NET_DEV_ETHERNET     ;
 NET_DEV_ETHERNET   = record
     char	sDVRIP[16];                     // DVR IP ��ַ ///
     char	sDVRIPMask[16];                 // DVR IP ��ַ���� ///
     DWORD	dwNetInterface;                 // 10M/100M  ����Ӧ,���� ///
                                                //1-10MBase - T
                                                //2-10MBase-T ȫ˫��
                                                //3-100MBase - TX
                                                //4-100M ȫ˫��
                                                //5-10M/100M  ����Ӧ
     WORD	wDVRPort;                       // �˿ں� ///
     BYTE	byMACAddr[MACADDR_LEN];         // �������������ַ ///
 end ;

 LPNET_DEV_NETCFG  =  ^NET_DEV_NETCFG     ;
 NET_DEV_NETCFG   = record
     DWORD	dwSize;
     NET_DEV_ETHERNET struEtherNet[MAX_ETHERNET];// ��̫���� ///
     char	sManageHostIP[16];				// Զ�̹���������ַ ///
     WORD	wManageHostPort;				// Զ�̹��������˿ں� ///
     char	sDNSIP[16];						// DNS ��������ַ ///
     char	sMultiCastIP[16];				// �ಥ���ַ ///
  WORD	wMultiCastPort;					// �ಥ�˿�///
     char	sGatewayIP[16];					// ���ص�ַ ///
     char	sNFSIP[16];						// NAS ����IP ��ַ ///
     BYTE	sNFSDirectory[PATHNAME_LEN];            	// NAS  Ŀ¼ ///
     DWORD	dwPPPOE;						// 0-������,1-���� ///
     BYTE	sPPPoEUser[NAME_LEN];                           // PPPoE �û��� ///
     char	sPPPoEPassword[PASSWD_LEN];	        	// PPPoE ���� ///
     char	sPPPoEIP[16];					//PPPoE IP ��ַ(ֻ��)
     WORD	wHttpPort;						//http �˿ں�
 end ;

//***********************************************************************
/// ͨ��ͼ�����ýṹ
///*********************************************************************/
 LPNET_DEV_HANDLEEXCEPTION  =  ^NET_DEV_HANDLEEXCEPTION     ;
 NET_DEV_HANDLEEXCEPTION   = record
 DWORD dwHandleType;						//����ʽ,����ʽ��"��"���*/
           //0x00: ����Ӧ*/
           //0x01: �������Ͼ���*/
           //0x02: ��������*/
           //0x04: �ϴ�����*/
           //0x08: �����������*/
 BYTE   byRelAlarmOut[MAX_ALARMOUT];     // �������������ͨ��,�������������,Ϊ 1 ��ʾ��������� ///
  end ;

 LPNET_DEV_MOTION  =  ^NET_DEV_MOTION     ;
 NET_DEV_MOTION   = record
    BYTE byMotionScope[18][22];				//�������,����22*18 ��С���,Ϊ 1 ��ʾ�ĺ�����ƶ��������,0-��ʾ����*/
 BYTE byMotionSenstive;					//�ƶ����������, 0 - 5,Խ��Խ����,0xff �ر�*/
    BYTE byEnableHandleMotion;				// �Ƿ����ƶ���� ///
    NET_DEV_HANDLEEXCEPTION strMotionHandleType; // ����ʽ ///
    NET_DEV_SCHEDTIME        struAlarmTime[MAX_DAYS][MAX_TIMESEGMENT];// ����ʱ��///
    BYTE byRelRecordChan[MAX_CHANNUM];		//����������¼��ͨ��,Ϊ 1 ��ʾ������ͨ��
 end ;
 
//�ڵ����� �����С704*576
 LPNET_DEV_HIDEALARM  =  ^NET_DEV_HIDEALARM     ;
 NET_DEV_HIDEALARM   = record
    DWORD	dwEnableHideAlarm;               // �Ƿ������ڵ�����  ,0-��,1-��������  2-��������  3-��������*/
    WORD	wHideAlarmAreaTopLeftX;          // �ڵ������x ���� ///
    WORD	wHideAlarmAreaTopLeftY;          // �ڵ������y ���� ///
    WORD	wHideAlarmAreaWidth;             // �ڵ�����Ŀ� ///
    WORD	wHideAlarmAreaHeight;            //�ڵ�����ĸ�*/
    NET_DEV_HANDLEEXCEPTION strHideAlarmHandleType;   // ����ʽ ///
    NET_DEV_SCHEDTIME        struAlarmTime[MAX_DAYS][MAX_TIMESEGMENT];   //����ʱ�� ///

//�źŶ�ʧ����
 LPNET_DEV_VILOST  =  ^NET_DEV_VILOST     ;
 NET_DEV_VILOST   = record
     BYTE byEnableHandleVILost;     // �Ƿ����źŶ�ʧ���� ///
     NET_DEV_HANDLEEXCEPTION strVILostHandleType; // ����ʽ ///
     NET_DEV_SCHEDTIME         struAlarmTime[MAX_DAYS][MAX_TIMESEGMENT]; // ����ʱ�� ///
 end ;
 

 LPNET_DEV_SHELTER  =  ^NET_DEV_SHELTER     ;
 NET_DEV_SHELTER   = record
     WORD wHideAreaTopLeftX;                  // �ڵ������x ���� ///
     WORD wHideAreaTopLeftY;                  // �ڵ������y ���� ///
     WORD wHideAreaWidth;                     // �ڵ�����Ŀ� ///
     WORD wHideAreaHeight;                    //�ڵ�����ĸ�*/
 end;

 LPNET_DEV_PICCFG  =  ^NET_DEV_PICCFG     ;
 NET_DEV_PICCFG   = record
     DWORD dwSize;
     BYTE sChanName[NAME_LEN];
     DWORD dwVideoFormat;					 // ֻ�� ��Ƶ��ʽ  1-NTSC 2-PAL*/
     BYTE byBrightness;						 //����,0-255*/
     BYTE byContrast;						 //�Աȶ�,0-255*/
     BYTE bySaturation;						 //���Ͷ�,0-255///
     BYTE byHue;							 //ɫ��,0-255*/
     //��ʾͨ����
     DWORD     dwShowChanName;				 // Ԥ����ͼ�����Ƿ���ʾͨ������,0-����ʾ,1-��ʾ �����С704*576

     WORD wShowNameTopLeftX;                 // ͨ��������ʾλ�õ�x ���� ///
     WORD wShowNameTopLeftY;                 // ͨ��������ʾλ�õ�y ���� ///
     //�źŶ�ʧ����
     NET_DEV_VILOST struVILost;
     //�ƶ����
     NET_DEV_MOTION struMotion;
     //�ڵ�����
     NET_DEV_HIDEALARM struHideAlarm;
     //�ڵ�    �����С704*576
     DWORD dwEnableHide;					// �Ƿ������ڵ�  ,0-��,1-��*/
     NET_DEV_SHELTER struShelter[MAX_SHELTERNUM];
     //OSD
     DWORD dwShowOsd;//     Ԥ����ͼ�����Ƿ���ʾOSD,0-����ʾ,1-��ʾ �����С704*576
     WORD wOSDTopLeftX;                     // OSD ��x ���� ///
     WORD wOSDTopLeftY;                     // OSD ��y ���� ///
     BYTE byOSDType;                        // OSD ����(��Ҫ�������ո�ʽ)///
     // 0: XXXX-XX-XX    ������ ///
     // 1: XX-XX-XXXX    ������ ///
     // 2: XXXX ��XX ��XX  �� ///
     // 3: XX ��XX  ��XXXX �� ///
     BYTE byDispWeek;                   // �Ƿ���ʾ���� ///
     BYTE byOSDAttrib;                  // OSD ����:͸������˸ ///
     // 1: ͸��,��˸ ///
     // 2: ͸��,����˸ ///
     // 3: ��˸,��͸�� ///
     // 4: ��͸��,����˸ ///
 end ;
//3.2.4   ѹ���������ýṹ

 LPNET_DEV_COMPRESSION_INFO  =  ^NET_DEV_COMPRESSION_INFO     ;
 NET_DEV_COMPRESSION_INFO   = record
 BYTE byStreamType;             // ��������0-��Ƶ��,1-������ ///
    BYTE byResolution;              // �ֱ���0-D1 1-HD1, 2-BCIF, 3-CIF, 4-QCIF,
         5-VGA , 6-QVGA, 7-SVCD, 8-NR*/
 BYTE byBitrateType;            // ��������0:�����ʣ�1:������ ///
 BYTE byPicQuality;             // ͼ������  6-���  5-�κ�  4-�Ϻ�  3-һ��  2-�ϲ�  1-��*/
    DWORD dwVideoBitrate;           // ��Ƶ����  0- ����  1-16K( ����)           2-32K  3-48k  4-64K
                                    //5-80K   6-96K  7-128K  8-160k  9-192K  10-224K   11-256K
                                    //12-320K    13-384K  14-448K   15-512K  16-640K   17-768K
                                    //18-896K 19-1024K 20-1280K 21-1536K 22-1792K 23-2048K
                                    // ���λ(31 λ)�ó� 1 ��ʾ���Զ�������,                  0-30 λ��ʾ����
                                    // ֵ����Сֵ 16k        ���ֵ 8192k*/
 DWORD dwVideoFrameRate;        // ֡��  0-ȫ��; 1-1/16; 2-1/8; 3-1/4; 4-1/2; 5-1; 6-2; 7-4; 8-6;
                                        // 9-8; 10-10; 11-12; 12-16; 13-20*/
  end ;

 LPNET_DEV_COMPRESSIONCFG  =  ^NET_DEV_COMPRESSIONCFG     ;
 NET_DEV_COMPRESSIONCFG   = record
     DWORD dwSize;                  // �˽ṹ�Ĵ�С ///
     NET_DEV_COMPRESSION_INFO struRecordPara; //        ¼�� ///
     NET_DEV_COMPRESSION_INFO struNetPara;            // ���� ///
 end ;
 
//ע�������������������еķֱ���ֻ�����ó� CIF ��QCIF��

//3.2.5   ¼��������ýṹ

 LPNET_DEV_RECORDSCHED  =  ^NET_DEV_RECORDSCHED     ;
 NET_DEV_RECORDSCHED   = record
     NET_DEV_SCHEDTIME struRecordTime;
     BYTE byRecordType;     //   0:��ʱ¼��1:�ƶ���⣬2:����¼��3:����|������4:����&����  5:�����, 6:  �ֶ�¼��*/
     char reservedData[3];  // ���� ///
 end ;
 
 LPNET_DEV_RECORDDAY  =  ^NET_DEV_RECORDDAY     ;
 NET_DEV_RECORDDAY   = record
     WORD wAllDayRecord;                // �Ƿ�ȫ��¼�� ///
     BYTE byRecordType;                 // ¼������  0:��ʱ¼��1:�ƶ���⣬2:����¼��3:����|������4:����&����  5:�����, 6:  �ֶ�¼��*/
     char reservedData;
 end ;

 LPNET_DEV_RECORD  =  ^NET_DEV_RECORD     ;
 NET_DEV_RECORD   = record
 DWORD dwSize;         // �˽ṹ�Ĵ�С ///
    DWORD dwRecord;       //�Ƿ�¼��  0-��  1-��*/
    NET_DEV_RECORDDAY struRecAllDay[MAX_DAYS];
    NET_DEV_RECORDSCHED struRecordSched[MAX_DAYS][MAX_TIMESEGMENT];
    DWORD dwRecordTime;        // ¼��ʱ�䳤�� ///
    DWORD dwPreRecordTime; //     Ԥ¼ʱ��  0-��Ԥ¼  1-5 ��  2-10 ��  3-15 ��  4-20 ��  5-25 �� 6-30 ��  7-0xffffffff(������Ԥ¼)///
 end ;

 //3.2.6   �������������ýṹ

 LPNET_DEV_DECODERCFG  =  ^NET_DEV_DECODERCFG     ;
 NET_DEV_DECODERCFG   = record
     DWORD dwSize;         // �˽ṹ�Ĵ�С ///
     DWORD dwBaudRate;      // ������(bps)(300��600��1200��2400��4800��9600��19200��
       38400��57600��76800��115.2k);///
      BYTE byDataBit;       // �����м�λ (5 ��6��7��8) ;///
      BYTE byStopBit;       // ֹͣλ  0 ��1 λ��1��2 λ;///
      BYTE byParity;        // У��  0 ����У�飬1����У�飬2��żУ��;///
      BYTE byFlowcontrol;    // 0 ���ޣ�1��������,2-Ӳ���� ///
      WORD wDecoderType; //    ����������,        ���±�*/
      WORD wDecoderAddress;       //��������ַ:0 - 255*/
      BYTE bySetPreset[MAX_PRESET];            // Ԥ�õ��Ƿ�����,0-û������,1-����*/
      BYTE bySetCruise[MAX_PRESET];            // Ѳ���Ƿ�����: 0-û������,1-���� ///
      BYTE bySetTrack[MAX_PRESET];             // �켣�Ƿ�����,0-û������,1-����*/
 end ;
 }
// PTZ type///
const YOULI = 0;
const LILIN_1016 = 1;
const LILIN_820 = 2;
const PELCO_P = 3;
const DM_QUICKBALL = 4;
const HD600 = 5;
const JC4116 = 6;
const PELCO_DWX = 7;
const PELCO_D = 8;
const VCOM_VC_2000 = 9;
const NETSTREAMER = 10;
const SAE = 11;
const SAMSUNG = 12;
const KALATEL_KTD_312 = 13;
const CELOTEX = 14;
const TLPELCO_P = 15;
const TL_HHX2000 = 16;
const BBV = 17;
const RM110 = 18;
const KC3360S = 19;
const ACES = 20;
const ALSON = 21;
const INV3609HD = 22;
const HOWELL = 23;
const TC_PELCO_P = 24;
const TC_PELCO_D = 25;
const AUTO_M = 26;
const AUTO_H = 27;
const ANTEN = 28;
const CHANGLIN = 29;
const DELTADOME = 30;
const XYM_12 = 31;
const ADR8060 = 32;
const EVI = 33;
const Demo_Speed = 34;
const DM_PELCO_D = 35;
const ST_832 = 36;
const LC_D2104 = 37;
const HUNTER = 38;
const A01 = 39;
const TECHWIN = 40;
const WEIHAN = 41;
const LG = 42;
const D_MAX = 43;
const PANASONIC = 44;
const KTD_348 = 45;
const INFINOVA = 46;
const PIH717 = 47;
const IDOME_IVIEW_LCU = 48;
const DENNARD_DOME = 49;
const PHLIPS = 50;
const SAMPLE = 51;
const PLD = 52;
const PARCO = 53;
const HY = 54;
const NAIJIE = 55;
const CAT_KING = 56;
const YH_06 = 57;
const SP9096X = 58;
const M_PANEL = 59;
const M_MV2050 = 60;
const SAE_QUICKBALL = 61;
const RED_APPLE = 62;
const NKO8G = 63;
const DH_CC440 = 64;

{
//3.2.7    �������ýṹ

 LPNET_DEV_PPPCFG  =  ^NET_DEV_PPPCFG     ;
 NET_DEV_PPPCFG   = record
      char sRemoteIP[16];             // Զ��IP ��ַ ///
      char sLocalIP[16];             //  ����IP ��ַ ///
      char sLocalIPMask[16];          // ����IP ��ַ���� ///
      BYTE sUsername[NAME_LEN];           // �û��� ///
      BYTE sPassword[PASSWD_LEN];          // ���� ///
      BYTE byPPPMode;                 // PPP ģʽ, 0��������1������ ///
      BYTE byRedial;                  // �Ƿ�ز� ��0-��,1-�� ///
      BYTE byRedialMode;              // �ز�ģʽ,0-�ɲ�����ָ��,1-Ԥ�ûز����� ///
      BYTE byDataEncrypt;             // ���ݼ���,0-��,1-�� ///
      DWORD dwMTU;                   // MTU///
      char sTelephoneNumber[PHONENUMBER_LEN];            // �绰���� ///
 end ;

 LPNET_DEV_RS232CFG  =  ^NET_DEV_RS232CFG     ;
     DWORD dwSize;                   // �˽ṹ�Ĵ�С ///
  DWORD dwBaudRate;               // (300��600��1200��2400��4800��9600��19200��
           38400��57600��76800��115.2k);///

     BYTE byDataBit;         // �����м�λ (5 ��6��7��8)///
     BYTE byStopBit;         // ֹͣλ  0 ��1 λ��1��2 λ;///
     BYTE byParity;              // У��  0 ����У�飬1����У�飬2��żУ��;///
     BYTE byFlowcontrol;     // 0 ���ޣ�1��������,2-Ӳ���� ///
     DWORD dwWorkMode;           // ����ģʽ��0��խ�����䣨232            �������� PPP  ���ţ���1������̨��232  �������ڲ������ƣ���2��͸��ͨ�� ///
     NET_DEV_PPPCFG struPPPConfig;
 end ;
 
//3.2.8  �����������ýṹ

 LPNET_DEV_ALARMINCFG  =  ^NET_DEV_ALARMINCFG     ;
 NET_DEV_ALARMINCFG   = record
    DWORD dwSize;        // �˽ṹ�Ĵ�С ///
     BYTE sAlarmInName[NAME_LEN];     // ���� ///
     BYTE byAlarmType;               // ����������,0������,1������ ///
     BYTE byAlarmInHandle;           // �Ƿ��� ///
     NET_DEV_HANDLEEXCEPTION struAlarmHandleType;          // ����ʽ ///
     NET_DEV_SCHEDTIME struAlarmTime[MAX_DAYS][MAX_TIMESEGMENT];//����ʱ��
     BYTE byRelRecordChan[MAX_CHANNUM];          // ����������¼��ͨ��,Ϊ 1  ��ʾ������ͨ�� ///
     BYTE byEnablePreset[MAX_CHANNUM];           // �Ƿ����Ԥ�õ� ///
     BYTE byPresetNo[MAX_CHANNUM];               // ���õ���̨Ԥ�õ����,һ�������� ����Ե��ö��ͨ������̨Ԥ�õ�, 0xff ��ʾ������Ԥ�õ㡣*/
     BYTE byEnableCruise[MAX_CHANNUM];           // �Ƿ����Ѳ�� ///
     BYTE byCruiseNo[MAX_CHANNUM];               // Ѳ�� ///
     BYTE byEnablePtzTrack[MAX_CHANNUM];         // �Ƿ���ù켣 ///
     BYTE byPTZTrack[MAX_CHANNUM];               // ���õ���̨�Ĺ켣��� ///
 end ;
//3.2.9  ����������ýṹ

 LPNET_DEV_ALARMOUTCFG  =  ^NET_DEV_ALARMOUTCFG     ;
 NET_DEV_ALARMOUTCFG   = record
     DWORD dwSize;       // �˽ṹ�Ĵ�С ///
     BYTE sAlarmOutName[NAME_LEN];        // ���� ///
     DWORD dwAlarmOutDelay; //  �������ʱ��(-1 Ϊ���ޣ��ֶ��ر�)///
     NET_DEV_SCHEDTIME   struAlarmOutTime[MAX_DAYS][MAX_TIMESEGMENT];//          �����������ʱ��� ///
 end;
//3.2.10   ����Ԥ���������ýṹ

 LPNET_DEV_PREVIEWCFG  =  ^NET_DEV_PREVIEWCFG     ;
 NET_DEV_PREVIEWCFG   = record
     DWORD dwSize;           // �˽ṹ�Ĵ�С ///
     BYTE byPreviewNumber;    // Ԥ����Ŀ,0-1 ����,1-4 ����,2-9 ����,3-16 ����,0xff:�����*/
     BYTE byEnableAudio;       // �Ƿ�����Ԥ��,0-��Ԥ��,1-Ԥ�� ///
     WORD wSwitchTime;         // �л�ʱ��,0-���л�,1-5s,2-10s,3-20s,4-60s,5-120s,6-300s///
     BYTE bySwitchSeq[MAX_WINDOW];            //�л�˳��,���lSwitchSeq[i]Ϊ  0xff ��ʾ����*/
 end ;
 
//3.2.11    ��Ƶ������ýṹ

 LPNET_DEV_VGAPARA  =  ^NET_DEV_VGAPARA     ;
 NET_DEV_VGAPARA   = record
     WORD wResolution;                           // �ֱ��� ///
     WORD wFreq;                                 // ˢ��Ƶ�� ///
     DWORD dwBrightness;                         // ���� ///
 end;

 LPNET_DEV_MATRIXPARA  =  ^NET_DEV_MATRIXPARA     ;
 NET_DEV_MATRIXPARA   = record
     WORD wDisplayLogo;                          // ��ʾ��Ƶͨ���� ///
     WORD wDisplayOsd;                           // ��ʾʱ�� ///
 end;

 LPNET_DEV_VOOUT  =  ^NET_DEV_VOOUT     ;
 NET_DEV_VOOUT   = record
     BYTE byVideoFormat;                         // �����ʽ,0-PAL,1-N///
     BYTE byMenuAlphaValue;                      // �˵��뱳��ͼ��Աȶ� ///
     WORD wScreenSaveTime;                       // ��Ļ����ʱ�� ///
     WORD wVOffset;                              // ��Ƶ���ƫ�� ///
     WORD wBrightness;                           // ��Ƶ������� ///
     BYTE byStartMode;                           // ��������Ƶ���ģʽ(0:�˵�,1:Ԥ��)*/
     char reservedData;
 end ;

 LPNET_DEV_VIDEOOUT  =  ^NET_DEV_VIDEOOUT     ;
 NET_DEV_VIDEOOUT   = record
     DWORD dwSize;
     NET_DEV_VOOUT struVOOut[MAX_VIDEOOUT];
     NET_DEV_VGAPARA struVGAPara[MAX_VGA];             // VGA ���� ///
     NET_DEV_MATRIXPARA struMatrixPara;          // MATRIX ���� ///
 end;

//3.2.12    �û��������ýṹ

//DVR �û�������չ�����ء�Զ�̻طţ�Զ��Ԥ��Ȩ��ϸ����ͨ����
 LPNET_DEV_USER_INFO  =  ^NET_DEV_USER_INFO     ;
 NET_DEV_USER_INFO   = record
     BYTE sUserName[NAME_LEN]; // �û��� ///
     BYTE sPassword[PASSWD_LEN];   // ���� ///
     DWORD dwLocalRight[MAX_RIGHT];    // Ȩ�� ///
                   //����0:  ���ؿ�����̨*/
                   //����1:  �����ֶ�¼��*/
                   //����2:  ���ػط�*/
                   //����3:  �������ò���*/
                   //����4:  ���ز鿴״̬����־*/
                   //����5:  ���ظ߼�����(��������ʽ�����������ػ�)*/
     DWORD dwLocalPlaybackRight; // ���ؿ��Իطŵ�ͨ��  bit0 -- channel 1*/
     DWORD dwRemoteRight[MAX_RIGHT];   // Ȩ�� ///
                   //����0:  Զ�̿�����̨*/
                   //���� 1:  Զ���ֶ�¼��*/
                   //����2:  Զ�̻ط� ///
                   //����3:  Զ�����ò���*/
                   //����4:  Զ�̲鿴״̬����־*/
                   //����5:  Զ�̸߼�����(��������ʽ�����������ػ�)*/
                   //����6:  Զ�̷��������Խ�*/
                   //����7:  Զ��Ԥ��*/
                   //���� 8:  Զ�����󱨾��ϴ����������*/
                   //����9:  Զ�̿��ƣ��������*/
                   //���� 10:  Զ�̿��ƴ���*/
     DWORD dwNetPreviewRight;  // Զ�̿���Ԥ����ͨ��  bit0 -- channel 1*/
     DWORD dwNetPlaybackRight;      // Զ�̿��Իطŵ�ͨ��  bit0 -- channel 1*/
     char sUserIP[16];    // �û�IP ��ַ(Ϊ0 ʱ��ʾ�����κε�ַ)///
     BYTE byMACAddr[MACADDR_LEN];            // �����ַ ///
 end ;

 LPNET_DEV_USER  =  ^NET_DEV_USER     ;
 NET_DEV_USER   = record
     DWORD dwSize;
     NET_DEV_USER_INFO struUser[MAX_USERNUM];
 end ;
 
//3.2.13   �쳣�������ýṹ

 LPNET_DEV_EXCEPTION  =  ^NET_DEV_EXCEPTION     ;
 NET_DEV_EXCEPTION   = record
     DWORD dwSize;
     NET_DEV_HANDLEEXCEPTION struExceptionHandleType[MAX_EXCEPTIONNUM];
     //����0-����,1-  Ӳ�̳���,2-���߶�,3-��������IP  ��ַ��ͻ,4-�Ƿ�����,   5-����/�����Ƶ��ʽ��ƥ��*/
 end;

//3.2.14    ֡��Ϣ���ýṹ

 LPNET_DEV_FRAMETYPECODE  =  ^NET_DEV_FRAMETYPECODE     ;
 NET_DEV_FRAMETYPECODE  = record
     BYTE code[12];       // ���� ///
 end;

 LPNET_DEV_FRAMEFORMAT = ^NET_DEV_FRAMEFORMAT ;
 NET_DEV_FRAMEFORMAT = record
    DWORD dwSize;
     char sATMIP[16];                           // ATM IP ��ַ ///
     DWORD dwATMType;                           // ATM ���� ///
     DWORD dwInputMode;                         // ���뷽ʽ ///
     DWORD dwFrameSignBeginPos;                 // ���ı�־λ����ʼλ��*/
     DWORD dwFrameSignLength;                   // ���ı�־λ�ĳ��� ///
     BYTE   byFrameSignContent[12];             // ���ı�־λ������ ///
     DWORD dwCardLengthInfoBeginPos;            // ���ų�����Ϣ����ʼλ�� ///
     DWORD dwCardLengthInfoLength;              // ���ų�����Ϣ�ĳ��� ///
     DWORD dwCardNumberInfoBeginPos;            // ������Ϣ����ʼλ�� ///
     DWORD dwCardNumberInfoLength;              // ������Ϣ�ĳ��� ///
     DWORD dwBusinessTypeBeginPos;              // �������͵���ʼλ�� ///
     DWORD dwBusinessTypeLength;                // �������͵ĳ��� ///
     NET_DEV_FRAMETYPECODE frameTypeCode[10];//         ���� ///
 end;

 }

//CLIENT_GetDEVConfig,CLIENT_GetDEVConfig�������
//const DEV_GET_DEVICECFG = 100; //��ȡ�豸����
//const DEV_SET_DEVICECFG = 100; //�����豸����
//const DEV_GET_NETCFG = 102; //��ȡ�������
//const DEV_SET_NETCFG = 102; //�����������
//const DEV_GET_PICCFG = 104; //��ȡͼ�����
//const DEV_SET_PICCFG = 104; //����ͼ�����
//const DEV_GET_COMPRESSCFG = 106; //��ȡѹ������
//const DEV_SET_COMPRESSCFG = 106; //����ѹ������
//const DEV_GET_RECORDCFG = 108; //��ȡ¼��ʱ�����
//const DEV_SET_RECORDCFG = 108; //����¼��ʱ�����
//const DEV_GET_DECODERCFG = 110; //��ȡ����������
//const DEV_SET_DECODERCFG = 110; //���ý���������
//const DEV_GET_RS232CFG = 112; //��ȡ232���ڲ���
//const DEV_SET_RS232CFG = 112; //����232���ڲ���
//const DEV_GET_ALARMINCFG = 114; //��ȡ�����������
//const DEV_SET_ALARMINCFG = 114; //���ñ����������
//const DEV_GET_ALARMOUTCFG = 116; //��ȡ�����������
//const DEV_SET_ALARMOUTCFG = 116; //���ñ����������
//const DEV_GET_TIMECFG = 118; //��ȡDVRʱ��
//const DEV_SET_TIMECFG = 118; //����DVRʱ��
//const DEV_GET_PREVIEWCFG = 120; //��ȡԤ������
//const DEV_SET_PREVIEWCFG = 120; //����Ԥ������
//const DEV_GET_VIDEOOUTCFG = 122; //��ȡ��Ƶ�������
//const DEV_SET_VIDEOOUTCFG = 122; //������Ƶ�������
//const DEV_GET_USERCFG = 124; //��ȡ�û�����
//const DEV_SET_USERCFG = 124; //�����û�����
//const DEV_GET_EXCEPTIONCFG = 126; //��ȡ�쳣����
//const DEV_SET_EXCEPTIONCFG = 126; //�����쳣����

const DH_DEV_PREVIEWCFG=4;		// Ԥ����������
const DH_N_COL_TSECT=2; // ��ɫʱ��θ���
// Ԥ��ͼ�����
//typedef struct
//{
//	DWORD				dwSize;
//	DH_VIDEOENC_OPT		stPreView;
//	DH_COLOR_CFG		stColorCfg[DH_N_COL_TSECT];
//}DHDEV_PREVIEW_CFG;

// ������ɫ����
//typedef struct
//{
//	DH_TSECT			stSect;
//	BYTE				byBrightness;			// ���ȣ�0-100
//	BYTE				byContrast;				// �Աȶȣ�0-100
//	BYTE				bySaturation;			// ���Ͷȣ�0-100
//	BYTE				byHue;					// ɫ�ȣ�0-100
//	BYTE				byGainEn;				// ����ʹ��
//	BYTE				byGain;					// ���棻0-100
//	BYTE				byReserved[2];
//} DH_COLOR_CFG, *LPDH_COLOR_CFG;


// ʱ��νṹ															    
//typedef struct
//{
//	BOOL				bEnable;				// ����ʾ¼��ʱ���ʱ����λ��ʾ�ĸ�ʹ�ܣ��ӵ�λ����λ�ֱ��ʾ����¼�󡢱���¼����ͨ¼�󡢶���ͱ���ͬʱ������¼��
//	int					iBeginHour;
//	int					iBeginMin;
//	int					iBeginSec;
//	int					iEndHour;
//	int					iEndMin;
//	int					iEndSec;
//} DH_TSECT, *LPDH_TSECT;
type
  LPDH_TSECT=^DH_TSECT;
  DH_TSECT=record
  bEnable:BOOL;//����ʾ¼��ʱ���ʱ����λ��ʾ�ĸ�ʹ�ܣ��ӵ�λ����λ�ֱ��ʾ����¼�󡢱���¼����ͨ¼�󡢶���ͱ���ͬʱ������¼��
  iBeginHour:int;
  iBeginMin:int;
  iBeginSec:int;
  iEndHour:int;
  iEndMin:int;
  iEndSec:int;
end;

LPDH_COLOR_CFG=^DH_COLOR_CFG;
DH_COLOR_CFG=record
  stSect:DH_TSECT;
  byBrightness:BYTE;//���ȣ�0-100
  byContrast:BYTE;//�Աȶȣ�0-100
  bySaturation:BYTE;//���Ͷȣ�0-100
  byHue:BYTE;//ɫ�ȣ�0-100
  byGainEn:BYTE;//����ʹ��
  byGain:BYTE;//���棻0-100
  byReserved:array[0..2-1] of BYTE;
end;

// ͨ������Ƶ����
//typedef struct
//{
//	// ��Ƶ����
//	BYTE				byVideoEnable;			// ��Ƶʹ�ܣ�1���򿪣�0���ر�
//	BYTE				byBitRateControl;		// �������ƣ����ճ���"��������"����
//	BYTE				byFramesPerSec;			// ֡��
//	BYTE				byEncodeMode;			// ����ģʽ�����ճ���"����ģʽ"����
//	BYTE				byImageSize;			// �ֱ��ʣ����ճ���"�ֱ���"����
//	BYTE				byImageQlty;			// ����1-6
//	WORD				wLimitStream;			// ����������
//	// ��Ƶ����
//	BYTE				byAudioEnable;			// ��Ƶʹ�ܣ�1���򿪣�0���ر�
//	BYTE				wFormatTag;				// ��Ƶ��������
//	WORD				nChannels;				// ������
//	WORD				wBitsPerSample;			// �������	
//	BYTE				bAudioOverlay;			// ��Ƶ����ʹ��
//	BYTE				bReserved_2;
//	DWORD				nSamplesPerSec;			// ������
//	BYTE				bIFrameInterval;		// I֡���֡��������������I֮֡���P֡������0-149
//	BYTE				bScanMode;				// NSP
//	BYTE				bReserved_3;
//	BYTE				bReserved_4;
//} DH_VIDEOENC_OPT, *LPDH_VIDEOENC_OPT;

LPDH_VIDEOENC_OPT=^DH_VIDEOENC_OPT;
DH_VIDEOENC_OPT=record
  //��Ƶ����
  byVideoEnable:BYTE;//��Ƶʹ�ܣ�1���򿪣�0���ر�
  byBitRateControl:BYTE;//�������ƣ����ճ���"��������"����
  byFramesPerSec:BYTE;//֡��
  byEncodeMode:BYTE;//����ģʽ�����ճ���"����ģʽ"����
  byImageSize:BYTE;//�ֱ��ʣ����ճ���"�ֱ���"����
  byImageQlty:BYTE;//����1-6
  wLimitStream:WORD;//����������
  //��Ƶ����
  byAudioEnable:BYTE;//��Ƶʹ�ܣ�1���򿪣�0���ر�
  wFormatTag:BYTE;//��Ƶ��������
  nChannels:WORD;//������
  wBitsPerSample:WORD;//�������
  bAudioOverlay:BYTE;//��Ƶ����ʹ��
  bReserved_2:BYTE;
  nSamplesPerSec:DWORD;//������
  bIFrameInterval:BYTE;//I֡���֡��������������I֮֡���P֡������0-149
  bScanMode:BYTE;//NSP
  bReserved_3:BYTE;
  bReserved_4:BYTE;
end;


type
  DHDEV_PREVIEW_CFG=record
    dwSize:DWORD;
    stPreView:DH_VIDEOENC_OPT;
    stColorCfg:array[0..DH_N_COL_TSECT-1] of DH_COLOR_CFG;
  end;



//��������
function CLIENT_GetDevConfig(lLoginID:LONG;dwCommand:DWORD;lChannel:LONG;lpOutBuffer:Pointer;dwOutBufferSize:DWORD;lpBytesReturned:LPDWORD;waittime:int=500):BOOL;stdcall; external DHNetSDK_API name 'CLIENT_GetDevConfig';

//function CLIENT_GetDevConfig(lLoginID: LONG; dwCommand: DWORD; lChannel: LONG; lpOutBuffer: Pointer; dwOutBufferSize: DWORD; var lpBytesReturned: DWORD): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_GetDevConfig';
function CLIENT_SetDevConfig(lLoginID: LONG; dwCommand: DWORD; lChannel: LONG; lpInBuffer: Pointer; dwInBufferSize: DWORD): BOOL; stdcall; external DHNetSDK_API name 'CLIENT_SetDevConfig';

const
DH_CAPTURE_SIZE_D1=$00000001;
DH_CAPTURE_SIZE_HD1=$00000002;
DH_CAPTURE_SIZE_BCIF=$00000004;
DH_CAPTURE_SIZE_CIF=$00000008;
DH_CAPTURE_SIZE_QCIF=$00000010;
DH_CAPTURE_SIZE_VGA=$00000020;
DH_CAPTURE_SIZE_QVGA=$00000040;
DH_CAPTURE_SIZE_SVCD=$00000080;
DH_CAPTURE_SIZE_QQVGA=$00000100;
DH_CAPTURE_SIZE_SVGA=$00000200;
DH_CAPTURE_SIZE_XVGA=$00000400;
DH_CAPTURE_SIZE_WXGA=$00000800;
DH_CAPTURE_SIZE_SXGA=$00001000;
DH_CAPTURE_SIZE_WSXGA=$00002000;
DH_CAPTURE_SIZE_UXGA=$00004000;
DH_CAPTURE_SIZE_WUXGA=$00008000;
DH_CAPTURE_SIZE_LFT=$00010000;
DH_CAPTURE_SIZE_720=$00020000;
DH_CAPTURE_SIZE_1080=$00040000;
DH_CAPTURE_SIZE_1_3M=$00080000;
DH_CAPTURE_SIZE_2M=$00100000;
DH_CAPTURE_SIZE_5M=$00200000;
DH_CAPTURE_SIZE_3M=$00400000;
DH_CAPTURE_SIZE_5_0M=$00800000;
DH_CPTRUTE_SIZE_1_2M=$01000000;
DH_CPTRUTE_SIZE_1408_1024=$02000000;
DH_CPTRUTE_SIZE_8M=$04000000;


implementation



end.
