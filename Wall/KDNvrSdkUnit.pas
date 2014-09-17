unit KDNvrSdkUnit;

interface
    uses windows;
const
    KDNvrSdkDll = 'nvrsdk.dll';

    NVR_LEN_PROXY_NAMEPWD = 64;
    NVR_LEN_NAME = 32;            // ������Ƴ��ȣ����豸�����豸���������û���
    NVR_LEN_GUID = 32;            // �豸��ƷGUID����
    NVR_MAX_ALARMIN = 16;         // ��󱨾�����
    NVR_MAX_ALARMOUT = 16;        // ��󱨾����
   NVR_MAX_MACADDR = 6;           // MAC��ַλ��

NVR_MAX_NVRNUM=127;	// �������ӵ�����NVR���� -->256
NVR_MAX_NVRDEVNUM=64;	// ����NVR���Թ�����������豸������豸������
NVR_MAX_NVRENCNUM=64;	// ����NVR���Թ�����������豸������
NVR_MAX_NVRDECNUM=64;	// ����NVR���Թ�����������豸������
NVR_MAX_NVRCHNNUM =64;  // ����NVR���Թ����������ͨ�������ͨ��������
NVR_MAX_DEVCHNNUM=16;  // ���������豸���еı���ͨ�����������
NVR_MAX_USERNUM	=64;  // NVR����û���Ŀ
NVR_MAX_MONITORNUM=64;	// ֧�ֵ����Monitor������TODO:������Ҫ�޸�
NVR_MAX_NVRALARM_INPUT=2;	// NVR�澯����������
NVR_MAX_PRIMARYSCRSETNUM=32;  // NVR�������ģʽ����������
NVR_MAX_NVRDEVALARM=8;   // NVRϵͳ�澯������
NVR_MAX_TVWCHN2860=64;  //NVR2860����ǽԤ������
NVR_MAXNUM_TVWPROJ= 16;  //������ǽԤ���� ����Ϊ16��Ԥ��

   NVR_LEN_DDNS_USERNAME=128;	// DDNS�û�����󳤶ȣ�����ȥ��
  NVR_LEN_DDNS_PWD=128;	// DDNS������󳤶ȣ�����ȥ��
  NVR_LEN_PPPOE_USERNAME=32;	// PPPoE�û�����󳤶ȣ�����ȥ��
  NVR_LEN_PPPOE_PWD=32;	// PPPoE������󳤶ȣ�����ȥ��
  NVR_MAXLEN_PICNAME=128;	// ͼƬ�ļ������ַ�����󳤶�
  NVR_LEN_LOGCONTENT=256;	// ��־����������Ϣ����󳤶�
  NVR_LEN_VERSION=64;	// ����汾���ַ�����󳤶�
  NVR_LEN_DEVSERIAL=16;	// �豸���к��ַ�����󳤶�
  NVR_MAXLEN_PRODUCTDATE=16;	// ��Ʒ���������ַ�����󳤶�
  NVR_LEN_DEVFLOWCODE=8;	// �豸��ˮ���ַ�����󳤶�
  NVR_LEN_URL=  255;//

  // ������Ҫ�ĺ�
  NVR_INVALID_HANDLE =-1;	// ��Ч�ľ��
  NVR_MAX_NETSND_DEST_NUM=5;
  NVR_NVRID_BEGIN=1;					// NVR ID����Сֵ
  NVR_NVRID_END	=NVR_MAX_NVRNUM	;	// NVR ID�����ֵ
  NVR_ENCID_BEGIN=1;					// ������ID��Сֵ
  NVR_ENCID_END	=NVR_MAX_NVRENCNUM;	// ������ID���ֵ
  NVR_DECID_BEGIN=128;					// ������ID��Сֵ
  NVR_DECID_END	=(NVR_DECID_BEGIN+NVR_MAX_NVRDECNUM-1);	// ������ID���ֵ
  NVR_CHNID_BEGIN=1;					// ���������������ͨ��ID����Сֵ
  NVR_CHNID_END	=NVR_MAX_DEVCHNNUM ;	// ���������������ͨ��ID�����ֵ
  NVR_SYNCPLAY_MAX =4;                   //ͬ���ط����·��
  NVR_INVALID_NVRID=$ff;		// �Ƿ���NVR ID��
  NVR_INVALID_DVSID=$ff;		// �Ƿ���DVS ID��
  NVR_INVALID_CHNID=$ff;		// �Ƿ���ͨ��ID��

type
    LPInt = PInteger;
    LPCSTR = PChar;
    LPWORD = PWORD;
    LPBYTE = PByte;

//// �޸�ʱ���õ��豸IP��Ϣ
//typedef struct TNVR_DEV_IPINFO
//{
//	BOOL  bModifyDevIP;					 //�Ƿ��޸��豸IP��Ϣ
//	DWORD dwGroupIp;                     //�鲥IP ������ inet_addr("224.16.32.1")
//	WORD  wPort;                         //��ǰport Ĭ�϶˿� 5510
//	DWORD dwOldIp;                       //������ip
//	DWORD dwNewIp;                       //������ip
//	DWORD dwNewMask;                     //������
//	DWORD dwNewGW;                       //������
//	BOOL  bModifyDevRegisterIP;		     //�Ƿ��޸��豸ע���ַIP��Ϣ
//	DWORD dwRegisterIP;                  //�豸��ע��IP
//	BYTE  abyGUID[NVR_LEN_GUID];		 // ��ƷGUID
//} *LPTNVR_DEVIPINFO;

{ //SHIHUADONG����
type
  Tm_tVideoParam=record
    case Integer of
    0:(struct: record
         m_bKeyFrame:Boolean;
         m_wVideoWidth:Word;
         m_wVideoHeight:Word;
         end;
       );

    1:(m_byAudioMode:Byte);
  end;
}

type
  Tm_tVideoParam=record
    m_bKeyFrame:Boolean;
    m_wVideoWidth:Word;
    m_wVideoHeight:Word
  end;

type
    LPTNVR_FRAMEHDR=^TNVR_FRAMEHDR;
    TNVR_FRAMEHDR = record
        m_byMediaType: Char;
        m_pData: PChar;
        m_dwPreBufSize: DWORD;
        m_dwDataSize: DWORD;
        m_byFrameRate: Byte;
        m_dwFrameID: DWORD;
        m_dwTimeStamp: DWORD;
        m_dwSSRC: DWORD;
        m_tVideoParam:Tm_tVideoParam;
    end;
//
////Frame Header Structure
//typedef struct TNVR_FRAMEHDR
//{
//    char  m_byMediaType; //ý������
//    char  *m_pData;       //���ݻ���
//    DWORD  m_dwPreBufSize;//m_pData����ǰԤ���˶��ٿռ䣬���ڼ�
//                          // RTP option��ʱ��ƫ��ָ��һ��Ϊ12+4+12
//                          // (FIXED HEADER + Extence option + Extence bit)
//    DWORD    m_dwDataSize;  //m_pDataָ���ʵ�ʻ����С�����С
//    BYTE	 m_byFrameRate; //����֡��,���ڽ��ն�
//    DWORD    m_dwFrameID;   //֡��ʶ�����ڽ��ն�
//    DWORD    m_dwTimeStamp; //ʱ���, ���ڽ��ն�
//    DWORD    m_dwSSRC;      //ͬ��Դ, ���ڽ��ն�
//    union
//    {
//        struct{
//                   BOOL    m_bKeyFrame;    //Ƶ֡���ͣ�I or P��
//                   WORD    m_wVideoWidth;  //��Ƶ֡��
//                   WORD    m_wVideoHeight; //��Ƶ֡��
//              }m_tVideoParam;
//        BYTE  m_byAudioMode;//��Ƶģʽ
//    };
//}*LPTNVR_FRAMEHDR;
  //�������
  PNVR_NET_SESSION = ^TNVR_NET_SESSION;
  TNVR_NET_SESSION  = record
      m_dwRTPAddr: DWORD;   //RTP��ַ(������)
      m_wRTPPort: DWORD;    //RTP�˿�(������)
      m_dwRTCPAddr: DWORD;  //RTCP��ַ(������)
      m_wRTCPPort: DWORD;   //RTCP�˿�(������)
  end;

  //�����������
  PNVR_LOCAL_NET_PARAM = ^TNVR_LOCAL_NET_PARAM;
  TNVR_LOCAL_NET_PARAM = record
     m_tLocalNet: TNVR_NET_SESSION;
     m_dwRtcpBackAddr: Dword;  //RTCP�ط���ַ
     m_wRtcpBackPort: Word;    //RTCP�ط��˿�
  end;

  //���緢�Ͳ���
  PNVR_SEND_NET_PARAM = ^TNVR_SEND_NET_PARAM;
  TNVR_SEND_NET_PARAM = record
     m_byNum: Byte;
     m_tLocalNet: TNVR_NET_SESSION;
     m_tRemoteNet: TNVR_NET_SESSION;
  end;

  LPTNVR_SOCKS5INFO = ^TNVR_SOCKS5INFO;
  TNVR_SOCKS5INFO = record
      dwProxyIP: DWORD;      // ���������Ip��ַ��������
      wProxyPort: WORD;      // ����������˿�
      szUserName: array[0..NVR_LEN_PROXY_NAMEPWD - 1] of Char;  // �����¼�û�
      szPassword: array[0..NVR_LEN_PROXY_NAMEPWD - 1] of Char;   // �����¼�û�����
  end;

  LPTNVR_CONNECTINFO = ^TNVR_CONNECTINFO;
  TNVR_CONNECTINFO = record
      szNVRAddr: array[0..MAX_PATH -1] of Char;           // NVR�ĵ�ַ������IP��ַ������
      wNVRPort: Word;                                     // ���Ӷ˿ںţ�һ��Ϊ1730
      szUserName: array[0..NVR_LEN_NAME-1] of Char;       // ��֤�û���
      szPassword: array[0..NVR_LEN_NAME-1] of Char;       // ��֤�û�����
      bRemoteConnect: Boolean;                            // FALSE��ʾ���ص�¼��TRUE��ʾԶ�̵�¼�����ص�¼ʱ����֧�ִ��������
      bUsedSocks: Boolean;                                // �Ƿ�ʹ�ô��������
      tSocks: TNVR_SOCKS5INFO;                            // Socks5�����������Ϣ
      wConnectState: Word;                                // ����״̬��0-δ���� 1-�����У�wConnectProgress��Ч��2-����������
      wConnectProgress: Word;                             // ���ӽ���
  end;

  // �豸��Ϣ����������������
  LPTNVR_DEVINFO = ^TNVR_DEVINFO;
  TNVR_DEVINFO  = record
	byNVRID: BYTE;			// �豸����NVR
	byDevID: BYTE;			// ������/������ID
	// �豸������Ϣ
	szDevName: array[0..NVR_LEN_NAME-1] of CHAR;	// �豸����
        dwDevIpAddr: DWORD;		// IP��ַ
	dwRegIp: DWORD;			// ��¼�豸ע���IP��ַ��NVR֧�ֶ�IP��
	byManuId: BYTE;			// �豸����
	szTypeName: array[0..NVR_LEN_NAME-1] of CHAR;	// �豸��������
        abyGUID: array[0..NVR_LEN_GUID-1] of BYTE;	// ��ƷGUID
	// �豸������Ϣ
        bySupportDoubleStream: BYTE;	// �Ƿ�֧��˫��
        bySupportSave: BYTE;            // �Ƿ�֧��SD���洢
	byVideoInPortNum: BYTE;	// ��Ƶ����˿�����
	byVideoEncNum: BYTE;	// ��Ƶ����ͨ������
	byVideoDecNum: BYTE;	// ��Ƶ����ͨ������
	byAudioEncNum: BYTE;	// ��Ƶ����ͨ������
	byAudioDecNum: BYTE;	// ��Ƶ����ͨ������
	bySerialPortNum: BYTE;	// ��������
	byInputPinNum: BYTE;	// ������������
	byAlarmInPortNum: BYTE;	// ������������
	byAlarmOutPortNum: BYTE;// �����������
        byImageShadeNum: BYTE;  // ͼ���ڱ�����
	// �豸����״̬��ע��״̬��
	byOnlineState: BYTE;	// �Ƿ�����
  end;

  LPTNVR_DEVSTATE = ^TNVR_DEVSTATE;
  TNVR_DEVSTATE = record
	abyAlarmInState: array[0..NVR_MAX_ALARMIN-1] of BYTE;			// �澯����״̬ 0-�޸澯 1-�и澯
	abyAlarmOutState: array[0..NVR_MAX_ALARMOUT-1]of BYTE;		// �澯���״̬ 0-����� 1-�����
  end;

  
// �豸ͨ��ID
  LPTNVR_DEVCHNID = ^TNVR_DEVCHNID;
  TNVR_DEVCHNID = record
	byDevID: BYTE;		// �豸�ţ����������������(1~256)
	byChnID: BYTE;		// �豸ͨ���š�(0~1)
	byReserved: BYTE;	// �ֽڶ��룬���ã��������ڱ���ض���Ϣ
	byReservedEx: BYTE;	// �ֽڶ��룬���ã��������ڱ���ض���Ϣ
  end;


//DVSͨ��״̬
  LPTNVR_DEVCHNSTATE = ^TNVR_DEVCHNSTATE;
  TNVR_DEVCHNSTATE = record
	byDspWorkState: BYTE;      // DSP����״̬ 0-DSP����Ӧ 1-DSP��������
        byVideoInPortState: BYTE;  // ��ƵԴ״̬ 0-��ƵԴ��ʧ 1-��ƵԴ��������
	byRecordLocal: BYTE;       // ǰ��¼��״̬ 0-��¼ 1-���ڱ���¼
	byRecordNvr: BYTE;         // ��Nvr��¼��״̬ ֵΪEmTaskState
	bySendVideo: BYTE;         // ������Ƶ 0-���� 1-��
	bySendSecondVideo: BYTE;   // ���͵ڶ�·��Ƶ 0-���� 1-��
	bySendAudio: BYTE;         // ������Ƶ 0-���� 1-��
	byRecvVideo: BYTE;         // ������Ƶ 0-���� 1-��
	byRecvAudio: BYTE;         // ������Ƶ 0-���� 1-��
	byAudioVolume: BYTE;       // ����(�ɼ�\��������)
	byVideoBitrate: DWORD;      // ��Ƶ����(��λKbps)
	bySecondVideoBitrate: DWORD;// �ڶ�·��Ƶ����(��λKbps)
  end;

  // ����ͨ����Ϣ
  LPTNVR_ENCCHNINFO = ^TNVR_ENCCHNINFO;
  TNVR_ENCCHNINFO = Record
	byDevID: BYTE;			// ������/������ID
	byChnID: BYTE;			// ������/������ͨ��ID
	byVideoType: BYTE;		// ��Ƶ�ŵ����ͣ�VIDEO_H261��
	byAudioType: BYTE;		// ��Ƶ�ŵ����ͣ�AUDIO_G711A��
	byResolution: BYTE;      // ��һ·��Ƶ�ŵ��ķֱ���
	bySecondResolution: BYTE;// �ڶ�·��Ƶ�ŵ��ķֱ���
	wBitrate: WORD;          // �ŵ�����(��λ:Kbps,1K=1024)
	wSecondBitrate: WORD;    // �ڶ�·�ŵ�����(��λ:Kbps,1K=1024)
	byVideoInPortIndex: BYTE;// ��ǰ������ƵԴ���
	byTransferNum: BYTE;	    // ��һ·��Ƶ�ŵ�ʹ�õ�ֱ��·��
	bySecondTransferNum: BYTE;// �ڶ�·��Ƶ�ŵ�ʹ�õ�ֱ��·��
	byReserved: BYTE;		// ����
	achChnAlias: array[0..NVR_LEN_NAME-1] of CHAR;   // ͨ������
  end;

  
// ����ͨ����Ϣ
  LPTNVR_DECCHNINFO = ^TNVR_DECCHNINFO;
  TNVR_DECCHNINFO = record
	byVideoType: BYTE;				// ��Ƶ�����ʽ
	byDispStyleAtNoVideo: BYTE;	    // ����������µ���Ļ��ʾ
	byOutputType: BYTE;			    // ��Ƶ����ӿ�����  ע����������Ч
	byPostPrcLvl: BYTE;			    // ������
	byFrequency: BYTE;				// VGAˢ��Ƶ��       ע����������Ч
	byPlayerBufNum: BYTE;		    // ���Ż������� 6-50
	byPlayerStartBufNum: BYTE;		// ������ʼ�������� 0-10
	byReserved: BYTE;                // ����
  end;

  LPTNVR_RTSPINFO = ^TNVR_RTSPINFO;
  TNVR_RTSPINFO = record
	byUseDns: BYTE;                   // 0:��ʹ�ã� 1��ʹ��
	szDns: array[0..NVR_LEN_DDNS_USERNAME+1 -1] of CHAR;
	szUrl: array[0..NVR_LEN_URL+1 - 1] of CHAR;
  end;

  //ONVIF�豸��Ȩ��Ϣ
  LPTNVR_ONVIFINFO = ^TNVR_ONVIFINFO;
  TNVR_ONVIFINFO = record
	byUserName: array[0..NVR_LEN_NAME+1 - 1] of BYTE;
	byPassWd: array[0..NVR_LEN_NAME+1 - 1] of BYTE;
  end;

  // �޸�ʱ���õ��豸IP��Ϣ
  LPTNVR_DEVIPINFO= ^TNVR_DEV_IPINFO;
  TNVR_DEV_IPINFO = record
	bModifyDevIP: BOOL;					 //�Ƿ��޸��豸IP��Ϣ
	dwGroupIp: DWORD;                     //�鲥IP ������ inet_addr("224.16.32.1")
	wPort: WORD;                         //��ǰport Ĭ�϶˿� 5510
	dwOldIp: DWORD;                       //������ip
	dwNewIp: DWORD;                       //������ip
	dwNewMask: DWORD;                     //������
	dwNewGW: DWORD;                       //������
	bModifyDevRegisterIP: Boolean;		     //�Ƿ��޸��豸ע���ַIP��Ϣ
	dwRegisterIP: DWORD;                  //�豸��ע��IP
        abyGUID: array[0..NVR_LEN_GUID-1] of BYTE;		 // ��ƷGUID
  end;

  LPTNVR_AUDIOINFO = ^TNVR_AUDIOINFO;
  TNVR_AUDIOINFO = record
    byCallMode: BYTE;     //0-���У�1-���У�2-�㲥
    byListenStatus: BYTE; //0-����Ƶ��1-����Ƶ
    byCallMute: BYTE;     //���о�����0-�Ǿ�����1-����
    byListenMute: BYTE;   //����������0-�Ǿ�����1-����
    byVolumeIn: BYTE;     //����������0~255��
    byVolumeOut: BYTE;    //���������0~255��
  end;

//  procedure NVRPFRAMECALLBACK(pFrmHdr: LPTNVR_FRAMEHDR; dwParam: DWORD); stdcall; external KDNvrSdkDll name 'NVRPFRAMECALLBACK';
//
//typedef void (CALLBACK *NVRPFRAMECALLBACK)(LPTNVR_FRAMEHDR pFrmHdr, DWORD dwParam);
//////////////////////////////////////////////////////////////////////////
// �ӿ�����
//////////////////////////////////////////////////////////////////////////


//������      : PNVRMSGCALLBACK
//����        : NVRSDK�ص����������ڽӿ��첽��Ϣ����������֪ͨ���������������
//�������˵��: wMessage����ϢID��ָNVR_MSG_��ͷ����Ϣ��
//              byNVRID��NVRID��ͨ��NVR_NewNVRID()�����õ�NVRID��
//			  wErrorCode��������룬��ΧΪNVR_ERR_��ͷ�Ĵ������
//			  wContextLen��ָʾpContext������������������wContextLenΪ0ʱ��
//			      pContext��ʾΪDWORDֵ����wContextLen���ȴ���0ʱ��pContext
//				  Ϊ����ָ�롣
//			  pContext��������Ϣ����ͬ��Ϣ��ͬ��������ο�NVR_MSG_��Ϣ˵��
//			  dwSender����dwSenderΪ0ʱ����ʾ��ϢΪNVR������Ϣ����dwSender��Ϊ
//			      0ʱ��dwSenderΪ�첽�ӿڴ���ķ����߱�ǣ����������첽�ӿڶ���
//				  dwSender������
//����ֵ˵��  : [BOOL] �������ɹ����򷵻�TRUE�����򷵻�FALSE��

//typedef void (CALLBACK *PNVRMSGCALLBACK)(WORD wMessage,
//                                         BYTE byNVRID,
//                                         WORD wErrorCode,
//                                         WORD wContextLen,
//                                         char* pContext,
//                                         DWORD dwSender);
   PNVRMSGCALLBACK = ^TNVRMSGCALLBACK;
   TNVRMSGCALLBACK=procedure(wMessage: WORD; byNVRID: BYTE; wErrorCode: WORD; wContextLen: Word; pContext: PChar; dwSender: DWORD) of object; stdcall;


  PNVRPFRAMECALLBACK=^TNVRPFRAMECALLBACK;
  TNVRPFRAMECALLBACK=procedure(pFrmHdr:LPTNVR_FRAMEHDR;dwParam:DWORD)of object; stdcall;



// [SDK�汾��Ϣ]
// �����汾�ţ������µ�NVRͬ��
function NVR_GetSDKVersion(): DWORD; stdcall; external KDNvrSdkDll index 168;

// ����汾�ţ��Զ������ʱ����
function NVR_GetSDKBuildVersion(): DWORD; stdcall; external KDNvrSdkDll index 167;

// [��ʼ��]
function NVR_Init(wLocalStreamPort: WORD; wTelnetPort: Word; bOpenTelnet: Boolean): Boolean; stdcall; external KDNvrSdkDll index 178;

function NVR_Cleanup(): Boolean; stdcall; external KDNvrSdkDll index 91;

function NVR_SetMessageCallBack(fMessageCallBack: PNVRMSGCALLBACK): Boolean; stdcall; external KDNvrSdkDll index 218;

// NVRSDKϵͳ������룬�������з���BOOL�ĺ���������ʹ�ô˺�����ȡ��ϸ�Ĵ�����Ϣ
function NVR_GetLastError(): DWORD; stdcall; external KDNvrSdkDll index 141;

// [����NVR]
// �趨���ӵĳ�ʱʱ������Դ��������飺dwWatiTimeΪ5000��dwTryTimesΪ10
function NVR_SetConnectTime(dwWaitTime: DWORD; dwTryTimes: DWORD): Boolean; stdcall; external KDNvrSdkDll index 214;

// ����NVRID
function NVR_NewNVRID(): Byte; stdcall; external KDNvrSdkDll index 189;

// �ͷ�NVRID
function NVR_FreeNVRID(): Boolean; stdcall; external KDNvrSdkDll index 117;

// ��ȡNVR״̬������NVR_STATE_
function NVR_GetNVRState(byNVRID: BYTE; pnNVRState: LPInt): Boolean; stdcall; external KDNvrSdkDll index 146;

// ����NVR���첽�ӿڣ����ӽ��ͨ��NVR_WM_CONNECTNVR��Ϣ�ϴ���lpszNVRAddr������IP�ַ�����URL��
function NVR_Connect(byNVRID: BYTE; lpszNVRAddr: LPCSTR;wNVRPort: Word;lpszUserName: LPCSTR;lpszPassword:LPCSTR; bRemoteConnect: Boolean;
                     lpSocks5Info: LPTNVR_SOCKS5INFO;dwSender: DWORD): Boolean; stdcall; external KDNvrSdkDll index 92;

function NVR_ConnectEx(byNVRID: BYTE; lpszNVRAddr: LPCSTR;wNVRPort: Word;lpszUserName: LPCSTR;lpszPassword:LPCSTR; bRemoteConnect: Boolean;
                     dwSender: DWORD): Boolean; stdcall; external KDNvrSdkDll index 93;

function NVR_Disconnect(byNVRID: Byte): Boolean; stdcall; external KDNvrSdkDll index 114;

// �����Ƿ��Ǵ��ڵ�NVRID
function NVR_IsValidNVR(byNVRID: Byte): Boolean; stdcall; external KDNvrSdkDll index 179;

// ��ȡNVR������Ϣ
function NVR_GetConnectInfo(byNVRID: Byte; lptConnectInfo: LPTNVR_CONNECTINFO): Boolean; stdcall; external KDNvrSdkDll index 120;

// ��ȡNVR�汾�źͲ�Ʒ�ͺ�
function NVR_GetNVRVersion(byNVRID: Byte; pwNvrVersion: LPWORD; pbyNvrType:LPBYTE ): Boolean; stdcall; external KDNvrSdkDll index 149;

// [�豸����]
// ��ȡNVR��������������������������
function NVR_GetEncCaps(byNVRID: Byte ): Byte; stdcall; external KDNvrSdkDll index 134;

// ��ȡNVR��������������������������
function NVR_GetDecCaps(byNVRID: Byte ): Byte; stdcall; external KDNvrSdkDll index 125;

//// ��ȡ������/������ͨ��������
function NVR_GetEncCount(byNVRID: Byte ): Byte; stdcall; external KDNvrSdkDll index 138;
function NVR_GetEncChnCount(byNVRID: Byte ): Byte; stdcall; external KDNvrSdkDll index 135;

// ��ȡ������������
function NVR_GetDecCount(byNVRID: Byte ): Byte; stdcall; external KDNvrSdkDll index 127;

// ��ȡһ��������������������Ϣ
function NVR_GetDevInfo(byNVRID: Byte; byDevID: Byte; lptDevInfo: LPTNVR_DEVINFO ): Byte; stdcall; external KDNvrSdkDll index 131;

// ��ȡ������/������id��
function NVR_GetEncId(byNVRID: Byte; pbyEncId: PUCHAR; nEncTableIndex: Integer ): Byte; stdcall; external KDNvrSdkDll index 139;
function NVR_GetDecId(byNVRID: Byte; pbyDecId: PUCHAR; nDecTableIndex: Integer ): Byte; stdcall; external KDNvrSdkDll index 128;

// ��ȡһ������������������״̬
function NVR_GetDevState(byNVRID: Byte; byDevID: BYTE; lptDevState: LPTNVR_DEVSTATE ): Boolean; stdcall; external KDNvrSdkDll index 132;

// ��ȡһ�����������������һ��ͨ����״̬
function NVR_GetDevChnState(byNVRID: Byte; tDevChnID: TNVR_DEVCHNID; lptChnState: LPTNVR_DEVCHNSTATE ): Boolean; stdcall; external KDNvrSdkDll index 130;

// ��ȡ����ͨ������Ϣ
function NVR_GetEncChnInfo(byNVRID: Byte; tDevChnID: TNVR_DEVCHNID; lptEncChnInfo: LPTNVR_ENCCHNINFO ): Boolean; stdcall; external KDNvrSdkDll index 136;

function NVR_GetEncChnInfoByIndex(byNVRID: Byte; byTableIndex: BYTE; lptEncChnInfo: LPTNVR_ENCCHNINFO ): Boolean; stdcall; external KDNvrSdkDll index 137;

// ��ȡ����ͨ������Ϣ
function NVR_GetDecChnInfo(byNVRID: Byte; tDevChnID: TNVR_DEVCHNID; lptDecChnInfo: LPTNVR_DECCHNINFO ): Boolean; stdcall; external KDNvrSdkDll index 126;

// ���������豸��Ϣ
function NVR_SearchDevice(byNVRID: Byte; dwIp: DWORD; wPort: WORD ): Boolean; stdcall; external KDNvrSdkDll index 208;

////����ONVIF�豸
function NVR_SearchONVIFDevice(byNVRID: Byte; dwIp: DWORD; dwSearchIp: DWORD; wSearchPort: WORD ): Boolean; stdcall; external KDNvrSdkDll index 210;

//// ����豸
function NVR_AddDevice(byNVRID: Byte; lptInfo: LPTNVR_DEVINFO): Boolean; stdcall; external KDNvrSdkDll index 82;

function NVR_AddDeviceEx(byNVRID: Byte; lptInfo: LPTNVR_DEVINFO): Boolean; stdcall; external KDNvrSdkDll index 83;   //�⳧���豸

function NVR_AddRTSPDevice(byNVRID: Byte; lptInfo: LPTNVR_DEVINFO; lptRtspInfo: LPTNVR_RTSPINFO): Boolean; stdcall; external KDNvrSdkDll index 87;  //RTSP�豸

function NVR_AddONVIFDevice(byNVRID: Byte; lptInfo: LPTNVR_DEVINFO; lptONVIFInfo: LPTNVR_ONVIFINFO; bDVS: Boolean): Boolean; stdcall; external KDNvrSdkDll index 85;  //RTSP�豸

// ɾ���豸
function NVR_DeleteDevice(byNVRID: Byte; byDevID: BYTE): Boolean; stdcall; external KDNvrSdkDll index 104;

//// �޸��豸IP��Ϣ���޸��豸ע��IP��Ϣ
function NVR_ModifyDeviceIP(byNVRID: Byte; ptDevIPInfo: LPTNVR_DEVIPINFO): Boolean; stdcall; external KDNvrSdkDll index 185;

// �õ��������豸���б���Ŀ
function NVR_GetSearchListNumber(byNVRID: Byte; pwNum: LPWORD): Boolean; stdcall; external KDNvrSdkDll index 171;

// �õ��������豸��Ϣ(�������)
function NVR_GetSearchDeviceInfoByNum(byNVRID: Byte; wNum: WORD;lptInfo: LPTNVR_DEVINFO ): Boolean; stdcall; external KDNvrSdkDll index 170;

// �õ��������豸��Ϣ(�����豸ID)
function NVR_GetSearchDeviceInfoByDvsId(byNVRID: Byte; byDvsId: BYTE;lptInfo: LPTNVR_DEVINFO ): Boolean; stdcall; external KDNvrSdkDll index 169;

// ��Ƶ���
function NVR_CreateMonitor(byNVRID: Byte; tDevChnID: TNVR_DEVCHNID;byFlowIndex: BYTE; hPlayWnd: HWND; bDec: Boolean=True): THandle; stdcall; external KDNvrSdkDll index 95;

function NVR_ChangeMonitorPlayWnd(hMonitor: THandle; hPlayWnd: HWND): Boolean; stdcall; external KDNvrSdkDll index 88;

function NVR_SwitchMonitor(hMonitor: THandle; byNVRID: BYTE; tDevChnID: TNVR_DEVCHNID; byFlowIndex: BYTE): Boolean; stdcall; external KDNvrSdkDll index 240;

function NVR_CtrlMonitor(hMonitor: THandle; dwCtrlCommand: DWORD; byContent: BYTE): Boolean; stdcall; external KDNvrSdkDll index 101;

function NVR_DestroyMonitor(hMonitor: THandle): Boolean; stdcall; external KDNvrSdkDll index 110;

// ��ȡý��״̬
function NVR_GetAudioStatus(hMonitor: THandle; lptAudioInfo: LPTNVR_AUDIOINFO): Boolean; stdcall; external KDNvrSdkDll index 118;

// ͼ��ץ��
function NVR_LocalCapture(hMonitor: THandle; lpszPicFileName: LPCTSTR;byPicType: BYTE): Boolean; stdcall; external KDNvrSdkDll index 182;

// PTZ��̨����
function NVR_PTZControl(hMonitor: THandle; dwPTZCommand: DWORD;byStep: BYTE): Boolean; stdcall; external KDNvrSdkDll index 191;

function NVR_PTZControlEx(byNVRID: BYTE; tDevChnID:TNVR_DEVCHNID; dwPTZCommand: DWORD;byStep: BYTE): Boolean; stdcall; external KDNvrSdkDll index 192;

function NVR_TransPTZControl(hMonitor: THandle; lpszPTZCtrlBuf:LPCTSTR; dwBufSize: DWORD): Boolean; stdcall; external KDNvrSdkDll index 242;

function NVR_TransPTZControlEx(byNVRID: BYTE; tDevChnID:TNVR_DEVCHNID; lpszPTZCtrlBuf: LPCTSTR;dwBufSize: DWORD): Boolean; stdcall; external KDNvrSdkDll index 243;
//NVR_API BOOL __stdcall NVR_SetRegFrameCallBack(HANDLE hMonitor, NVRPFRAMECALLBACK fFrameCallBack, DWORD dwParam);
//NVR_API HANDLE __stdcall NVR_CreateMonitorEx(LTNVR_LOCAL_NETPARAM lpVideoNet,

function NVR_SetRegFrameCallBack(hMonitor:THandle; fFrameCallBack:PNVRPFRAMECALLBACK; dwParam:DWORD):Boolean;stdcall; external KDNvrSdkDll index 226;


implementation

end.
