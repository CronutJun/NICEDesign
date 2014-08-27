
/* Drop Tables */

DROP TABLE IN.T_RC_INI_INF_HIS;
DROP TABLE IN.T_RC_INI_INF;
DROP TABLE IN.T_RC_REG_INF_HIS;
DROP TABLE IN.T_RC_REG_INF;
DROP TABLE IN.T_RM_FILE_HIS;
DROP TABLE IN.T_RM_FILE;
DROP TABLE IN.T_RM_COMMON;
DROP TABLE IN.T_RM_MAC_ENV_HIS;
DROP TABLE IN.T_RM_MAC_ENV;
DROP TABLE IN.T_RM_MSG_HIS;
DROP TABLE IN.T_RM_MSG;
DROP TABLE IN.T_RM_TRX;
DROP TABLE IN.T_PM_UPDS_MAC;
DROP TABLE IN.T_PM_UPDS_GRP;
DROP TABLE IN.T_PM_MAC_STS;
DROP TABLE IN.T_PM_PGM_VER;
DROP TABLE IN.T_PM_PGM;



/* Drop Sequences */

DROP SEQUENCE IN.SEQ_FILE_SEQ;
DROP SEQUENCE IN.SEQ_MSG_SEQ;
DROP SEQUENCE IN.SEQ_TRX_SEQ;




/* Create Sequences */

CREATE SEQUENCE IN.SEQ_FILE_SEQ AS DECIMAL(7) INCREMENT BY 1 MINVALUE 0 MAXVALUE 9999999 START WITH 1 CYCLE;
CREATE SEQUENCE IN.SEQ_MSG_SEQ AS DECIMAL(7) INCREMENT BY 1 MINVALUE 0 MAXVALUE 9999999 START WITH 1 CYCLE;
CREATE SEQUENCE IN.SEQ_TRX_SEQ AS DECIMAL(7) INCREMENT BY 1 MINVALUE 0 MAXVALUE 9999999 START WITH 1 CYCLE;



/* Create Tables */

CREATE TABLE IN.T_RM_MAC_ENV
(
  ORG_CD varchar(3) NOT NULL,
  BRANCH_CD varchar(8) NOT NULL,
  MAC_NO varchar(12) NOT NULL,
  INSERT_UID varchar(10) NOT NULL,
  INSERT_DATE timestamp NOT NULL,
  UPDATE_UID varchar(10) NOT NULL,
  UPDATE_DATE timestamp NOT NULL,
  STS varchar(1) NOT NULL,
  SITE_CD varchar(6) NOT NULL,
  DEPT_CD varchar(2),
  OFFICE_CD varchar(2),
  TEAM_CD varchar(2),
  PRDC_NO varchar(20),
  MKR_CD varchar(4),
  MODEL_CD varchar(4),
  AP_VER varchar(12),
  SET_PLACE varchar(1),
  PUB_IP_ADDR varchar(15),
  PRI_IP_ADDR varchar(15),
  IP_PORT varchar(5),
  HOST_IP_ADDR varchar(15),
  HOST_IP_PORT varchar(5),
  AOC_IP_ADDR varchar(15),
  AOC_IP_PORT varchar(5),
  REBOOT_TIME varchar(6),
  MAC_OS varchar(260),
  MAC_CPU varchar(260),
  MAC_MEM varchar(260),
  MAC_HDD varchar(260),
  MODEM_RELAY_YN varchar(1),
  RPC_YN varchar(1),
  CREDIT_CARD_YN varchar(1),
  CARD_LOAN_YN varchar(1),
  CHRG_HIPASS_YN varchar(1),
  FRGN_TRAN_TYPE varchar(1) DEFAULT '0',
  OUR_MAX_WDR_AMT decimal(12),
  THR_MAX_WDR_AMT decimal(12),
  OUR_MAX_DPS_AMT decimal(12),
  THR_MAX_DPS_AMT decimal(12),
  OUR_MAX_TSF_AMT decimal(12),
  THR_MAX_TSF_AMT decimal(12),
  MAX_SVC_WDR_AMT numeric(12),
  MAX_CASH_WDR_CNT decimal(3),
  MAX_CASH_DPS_CNT decimal(3),
  MAX_CASH_SVC_WDR_CNT decimal(3),
  PRIMARY KEY (ORG_CD, BRANCH_CD, MAC_NO)
)
IN INFO_AMS01
INDEX IN INFO_AMSINDEX01;

ALTER TABLE IN.T_RM_MAC_ENV
  DATA CAPTURE NONE
  PCTFREE 0
  LOCKSIZE ROW
  APPEND OFF
  NOT VOLATILE;

COMMENT ON TABLE IN.T_RM_MAC_ENV IS '���ȯ��';

COMMENT ON IN.T_RM_MAC_ENV (
    ORG_CD               IS '����ڵ�',
    BRANCH_CD            IS '�����ڵ�',
    MAC_NO               IS '���',
    INSERT_UID           IS '�����',
    INSERT_DATE          IS '�����',
    UPDATE_UID           IS '������',
    UPDATE_DATE          IS '������',
    STS                  IS '����',
    SITE_CD              IS '����Ʈ�ڵ�',
    DEPT_CD              IS '�μ��ڵ�',
    OFFICE_CD            IS '�繫���ڵ�',
    TEAM_CD              IS '�����ڵ�',
    PRDC_NO              IS '���������ȣ',
    MKR_CD               IS '�������ڵ�',
    MODEL_CD             IS '�����ڵ�',
    AP_VER               IS '���α׷�����',
    SET_PLACE            IS '��ġ���',
    PUB_IP_ADDR          IS 'ATM IP�ּ�1',
    PRI_IP_ADDR          IS 'ATM IP�ּ�2',
    IP_PORT              IS 'ATM IP ��Ʈ',
    HOST_IP_ADDR         IS 'HOST IP �ּ�',
    HOST_IP_PORT         IS 'HOST IP ��Ʈ',
    AOC_IP_ADDR          IS 'AOC IP �ּ�',
    AOC_IP_PORT          IS 'AOC IP ��Ʈ',
    REBOOT_TIME          IS '������ ����ð�',
    MAC_OS               IS 'OS',
    MAC_CPU              IS 'CPU',
    MAC_MEM              IS 'Memory',
    MAC_HDD              IS 'HDD',
    MODEM_RELAY_YN       IS '�𵩸����̻�뿩��',
    RPC_YN               IS 'RPC��뿩��',
    CREDIT_CARD_YN       IS '�ſ�ī�� �ŷ�',
    CARD_LOAN_YN         IS 'ī��� �ŷ�',
    CHRG_HIPASS_YN       IS '�����н�������뿩��',
    FRGN_TRAN_TYPE       IS '�ؿ�ī��ŷ� ��������',
    OUR_MAX_WDR_AMT      IS '�����ִ���ݰ��ɱݾ�',
    THR_MAX_WDR_AMT      IS 'Ÿ���ִ���ݰ��ɱݾ�',
    OUR_MAX_DPS_AMT      IS '�����ִ��Աݱݾ�',
    THR_MAX_DPS_AMT      IS 'Ÿ���ִ��Աݱݾ�',
    OUR_MAX_TSF_AMT      IS '�����ִ���ü�ݾ�',
    THR_MAX_TSF_AMT      IS 'Ÿ���ִ���ü�ݾ�',
    MAX_SVC_WDR_AMT      IS '�ִ뼭����ݰ��ɱݾ�',
    MAX_CASH_WDR_CNT     IS '�ִ���ݰ������ݸż�',
    MAX_CASH_DPS_CNT     IS '�ִ��Աݰ������ݸż�',
    MAX_CASH_SVC_WDR_CNT IS '�ִ뼭����ݰ������ݸż�'
);

CREATE TABLE IN.T_RM_MAC_ENV_HIS
(
  ORG_CD varchar(3) NOT NULL,
  BRANCH_CD varchar(8) NOT NULL,
  MAC_NO varchar(12) NOT NULL,
  TRX_DATE varchar(8) NOT NULL,
  TRX_NO varchar(7) NOT NULL,
  INSERT_UID varchar(10) NOT NULL,
  INSERT_DATE timestamp NOT NULL,
  STS varchar(1) NOT NULL,
  SITE_CD varchar(6) NOT NULL,
  DEPT_CD varchar(2),
  OFFICE_CD varchar(2),
  TEAM_CD varchar(2),
  PRDC_NO varchar(20),
  MKR_CD varchar(4),
  MODEL_CD varchar(4),
  AP_VER varchar(12),
  SET_PLACE varchar(1),
  PUB_IP_ADDR varchar(15),
  PRI_IP_ADDR varchar(15),
  IP_PORT varchar(5),
  HOST_IP_ADDR varchar(15),
  HOST_IP_PORT varchar(5),
  AOC_IP_ADDR varchar(15),
  AOC_IP_PORT varchar(5),
  REBOOT_TIME varchar(6),
  MAC_OS varchar(260),
  MAC_CPU varchar(260),
  MAC_MEM varchar(260),
  MAC_HDD varchar(260),
  MODEM_RELAY_YN varchar(1),
  RPC_YN varchar(1),
  CREDIT_CARD_YN varchar(1),
  CARD_LOAN_YN varchar(1),
  CHRG_HIPASS_YN varchar(1),
  FRGN_TRAN_TYPE varchar(1) DEFAULT '0',
  OUR_MAX_WDR_AMT decimal(12),
  THR_MAX_WDR_AMT decimal(12),
  OUR_MAX_DPS_AMT decimal(12),
  THR_MAX_DPS_AMT decimal(12),
  OUR_MAX_TSF_AMT decimal(12),
  THR_MAX_TSF_AMT decimal(12),
  MAX_SVC_WDR_AMT numeric(12),
  MAX_CASH_WDR_CNT decimal(3),
  MAX_CASH_DPS_CNT decimal(3),
  MAX_CASH_SVC_WDR_CNT decimal(3),
  PRIMARY KEY (ORG_CD, BRANCH_CD, MAC_NO, TRX_DATE, TRX_NO)
)
IN INFO_AMS01
INDEX IN INFO_AMSINDEX01;

ALTER TABLE IN.T_RM_MAC_ENV_HIS
  DATA CAPTURE NONE
  PCTFREE 0
  LOCKSIZE ROW
  APPEND OFF
  NOT VOLATILE;

COMMENT ON TABLE IN.T_RM_MAC_ENV_HIS IS '���ȯ���̷�';

COMMENT ON IN.T_RM_MAC_ENV_HIS (
    ORG_CD               IS '����ڵ�',
    BRANCH_CD            IS '�����ڵ�',
    MAC_NO               IS '���',
    TRX_DATE             IS '�ŷ���',
    TRX_NO               IS '�ŷ���ȣ',
    INSERT_UID           IS '�����',
    INSERT_DATE          IS '�����',
    STS                  IS '����',
    SITE_CD              IS '����Ʈ�ڵ�',
    DEPT_CD              IS '�μ��ڵ�',
    OFFICE_CD            IS '�繫���ڵ�',
    TEAM_CD              IS '�����ڵ�',
    PRDC_NO              IS '���������ȣ',
    MKR_CD               IS '�������ڵ�',
    MODEL_CD             IS '�����ڵ�',
    AP_VER               IS '���α׷�����',
    SET_PLACE            IS '��ġ���',
    PUB_IP_ADDR          IS 'ATM IP�ּ�1',
    PRI_IP_ADDR          IS 'ATM IP�ּ�2',
    IP_PORT              IS 'ATM IP ��Ʈ',
    HOST_IP_ADDR         IS 'HOST IP �ּ�',
    HOST_IP_PORT         IS 'HOST IP ��Ʈ',
    AOC_IP_ADDR          IS 'AOC IP �ּ�',
    AOC_IP_PORT          IS 'AOC IP ��Ʈ',
    REBOOT_TIME          IS '������ ����ð�',
    MAC_OS               IS 'OS',
    MAC_CPU              IS 'CPU',
    MAC_MEM              IS 'Memory',
    MAC_HDD              IS 'HDD',
    MODEM_RELAY_YN       IS '�𵩸����̻�뿩��',
    RPC_YN               IS 'RPC��뿩��',
    CREDIT_CARD_YN       IS '�ſ�ī�� �ŷ�',
    CARD_LOAN_YN         IS 'ī��� �ŷ�',
    CHRG_HIPASS_YN       IS '�����н�������뿩��',
    FRGN_TRAN_TYPE       IS '�ؿ�ī��ŷ� ��������',
    OUR_MAX_WDR_AMT      IS '�����ִ���ݰ��ɱݾ�',
    THR_MAX_WDR_AMT      IS 'Ÿ���ִ���ݰ��ɱݾ�',
    OUR_MAX_DPS_AMT      IS '�����ִ��Աݱݾ�',
    THR_MAX_DPS_AMT      IS 'Ÿ���ִ��Աݱݾ�',
    OUR_MAX_TSF_AMT      IS '�����ִ���ü�ݾ�',
    THR_MAX_TSF_AMT      IS 'Ÿ���ִ���ü�ݾ�',
    MAX_SVC_WDR_AMT      IS '�ִ뼭����ݰ��ɱݾ�',
    MAX_CASH_WDR_CNT     IS '�ִ���ݰ������ݸż�',
    MAX_CASH_DPS_CNT     IS '�ִ��Աݰ������ݸż�',
    MAX_CASH_SVC_WDR_CNT IS '�ִ뼭����ݰ������ݸż�'
);

CREATE TABLE IN.T_RM_COMMON
(
  LCD varchar(6) NOT NULL,
  MCD varchar(6) NOT NULL,
  SCD varchar(6) NOT NULL,
  INSERT_DATE timestamp NOT NULL,
  INSERT_UID varchar(10) NOT NULL,
  UPDATE_DATE timestamp NOT NULL,
  UPDATE_UID varchar(10) NOT NULL,
  CD_NM varchar(100) NOT NULL,
  CD_NM1 varchar(100),
  CD_NM2 varchar(100),
  CD_NM3 varchar(100),
  CD_NM4 varchar(100),
  CD_NM5 varchar(100),
  CD_NM6 varchar(100),
  PRIMARY KEY (LCD, MCD, SCD)
)
IN INFO_AMS01
INDEX IN INFO_AMSINDEX01;

ALTER TABLE IN.T_RM_COMMON
  DATA CAPTURE NONE
  PCTFREE 0
  LOCKSIZE ROW
  APPEND OFF
  NOT VOLATILE;

COMMENT ON TABLE IN.T_RM_COMMON IS '�����ڵ�';

COMMENT ON IN.T_RM_COMMON (
    LCD         IS '��з�',
    MCD         IS '�ߺз�',
    SCD         IS '�Һз�',
    INSERT_DATE IS '�����',
    INSERT_UID  IS '�����',
    UPDATE_DATE IS '������',
    UPDATE_UID  IS '������',
    CD_NM       IS '�з���',
    CD_NM1      IS '���λ���1',
    CD_NM2      IS '���λ���2',
    CD_NM3      IS '���λ���3',
    CD_NM4      IS '���λ���4',
    CD_NM5      IS '���λ���5',
    CD_NM6      IS '���λ���6'
    );

CREATE TABLE IN.T_RM_TRX
(
  TRX_DATE varchar(8) NOT NULL,
  TRX_NO varchar(7) NOT NULL,
  TRX_TIME varchar(6) NOT NULL,
  TRX_CD varchar(8) NOT NULL,
  TRX_UID varchar(10) NOT NULL,
  ACT_CD varchar(8),
  PRIMARY KEY (TRX_DATE, TRX_NO)
)
IN INFO_AMS01
INDEX IN INFO_AMSINDEX01;

ALTER TABLE IN.T_RM_TRX
  DATA CAPTURE NONE
  PCTFREE 0
  LOCKSIZE ROW
  APPEND OFF
  NOT VOLATILE;

COMMENT ON TABLE IN.T_RM_TRX IS '�ŷ�����';

COMMENT ON IN.T_RM_TRX (
    TRX_DATE IS '�ŷ���',
    TRX_NO   IS '�ŷ���ȣ',
    TRX_TIME IS '�ŷ��ð�',
    TRX_CD   IS '�ŷ��ڵ�',
    TRX_UID  IS '�ŷ���',
    ACT_CD   IS '�����ڵ�'
);

CREATE TABLE IN.T_RM_MSG
(
  CREATE_DATE varchar(8) NOT NULL,
  MSG_SEQ varchar(36) NOT NULL,
  CREATE_TIME varchar(6) NOT NULL,
  INSERT_UID varchar(10) NOT NULL,
  INSERT_DATE timestamp NOT NULL,
  UPDATE_UID varchar(10) NOT NULL,
  UPDATE_DATE timestamp NOT NULL,
  MAC_NO varchar(12) NOT NULL,
  MAC_MSG_SEQ varchar(6),
  IO_CL varchar(1) NOT NULL,
  MSG_STS varchar(1),
  MSG_TYPE varchar(2) NOT NULL,
  MSG_CD varchar(4) NOT NULL,
  SVC_CD varchar(4) NOT NULL,
  MAC_SER_NO varchar(20),
  BRANCH_CD varchar(8),
  ORG_CD varchar(3),
  TRX_DATE varchar(8),
  TRX_NO varchar(7),
  PRIMARY KEY (CREATE_DATE, MSG_SEQ)
)
IN INFO_AMS01
INDEX IN INFO_AMSINDEX01;

ALTER TABLE IN.T_RM_MSG
  DATA CAPTURE NONE
  PCTFREE 0
  LOCKSIZE ROW
  APPEND OFF
  NOT VOLATILE;

COMMENT ON TABLE IN.T_RM_MSG IS '��������';

COMMENT ON IN.T_RM_MSG (
    CREATE_DATE IS '����������',
    MSG_SEQ     IS '��������',
    CREATE_TIME IS '���������ð�',
    INSERT_UID  IS '�����',
    INSERT_DATE IS '�����',
    UPDATE_UID  IS '������',
    UPDATE_DATE IS '������',
    MAC_NO      IS '����ȣ',
    MAC_MSG_SEQ IS '�����������',
    IO_CL       IS 'IO����',
    MSG_STS     IS '��������',
    MSG_TYPE    IS '�޼���Ÿ��',
    MSG_CD      IS '�޼����ڵ�',
    SVC_CD      IS '�����ڵ�',
    MAC_SER_NO  IS '����Ϸù�ȣ',
    BRANCH_CD   IS '�����ڵ�',
    ORG_CD      IS '����ڵ�',
    TRX_DATE    IS '�ŷ���',
    TRX_NO      IS '�ŷ���ȣ'
);

CREATE TABLE IN.T_RM_MSG_HIS
(
  CREATE_DATE varchar(8) NOT NULL,
  MSG_SEQ varchar(36) NOT NULL,
  HIS_SEQ varchar(6) NOT NULL,
  CREATE_TIME varchar(6) NOT NULL,
  INSERT_UID varchar(10) NOT NULL,
  INSERT_DATE timestamp NOT NULL,
  MAC_NO varchar(12) NOT NULL,
  MAC_MSG_SEQ varchar(6),
  MSG_STS varchar(1),
  MSG_TYPE varchar(2) NOT NULL,
  MSG_CD varchar(4) NOT NULL,
  SVC_CD varchar(4) NOT NULL,
  MAC_SER_NO varchar(20),
  BRANCH_CD varchar(8),
  ORG_CD varchar(3),
  MSG_CTX varchar(4000),
  PRIMARY KEY (CREATE_DATE, MSG_SEQ, HIS_SEQ)
)
IN INFO_AMS01
INDEX IN INFO_AMSINDEX01;

ALTER TABLE IN.T_RM_MSG_HIS
  DATA CAPTURE NONE
  PCTFREE 0
  LOCKSIZE ROW
  APPEND OFF
  NOT VOLATILE;


COMMENT ON TABLE IN.T_RM_MSG_HIS IS '����ó���̷�';

COMMENT ON IN.T_RM_MSG_HIS (
    CREATE_DATE IS '����������',
    MSG_SEQ     IS '��������',
    HIS_SEQ     IS '�̷¼���',
    CREATE_TIME IS '���������ð�',
    INSERT_UID  IS '�����',
    INSERT_DATE IS '�����',
    MAC_NO      IS '����ȣ',
    MAC_MSG_SEQ IS '�����������',
    MSG_STS     IS '��������',
    MSG_TYPE    IS '�޼���Ÿ��',
    MSG_CD      IS '�޼����ڵ�',
    SVC_CD      IS '�����ڵ�',
    MAC_SER_NO  IS '����Ϸù�ȣ',
    BRANCH_CD   IS '�����ڵ�',
    ORG_CD      IS '����ڵ�',
    MSG_CTX     IS '��������'
);

CREATE TABLE IN.T_RC_REG_INF
(
  ORG_CD varchar(3) NOT NULL,
  BRANCH_CD varchar(8) NOT NULL,
  MAC_NO varchar(12) NOT NULL,
  REG_BASE_KEY varchar(32) NOT NULL,
  REG_KEY_PATH varchar(260) NOT NULL,
  REG_KEY_NM varchar(64) NOT NULL,
  INSERT_UID varchar(10) NOT NULL,
  INSERT_DATE timestamp NOT NULL,
  UPDATE_UID varchar(10) NOT NULL,
  UPDATE_DATE timestamp NOT NULL,
  REG_VAL varchar(64),
  PRIMARY KEY (ORG_CD, BRANCH_CD, MAC_NO, REG_BASE_KEY, REG_KEY_PATH, REG_KEY_NM)
)
IN INFO_AMS01
INDEX IN INFO_AMSINDEX01;

ALTER TABLE IN.T_RC_REG_INF
  DATA CAPTURE NONE
  PCTFREE 0
  LOCKSIZE ROW
  APPEND OFF
  NOT VOLATILE;

COMMENT ON TABLE IN.T_RC_REG_INF IS '��ⷹ����Ʈ������';

COMMENT ON IN.T_RC_REG_INF (
    ORG_CD       IS '����ڵ�',
    BRANCH_CD    IS '�����ڵ�',
    MAC_NO       IS '���',
    REG_BASE_KEY IS '������Ʈ���⺻Ű',
    REG_KEY_PATH IS '������Ʈ��Ű���',
    REG_KEY_NM   IS '������Ʈ��Ű��',
    INSERT_UID   IS '�����',
    INSERT_DATE  IS '�����',
    UPDATE_UID   IS '������',
    UPDATE_DATE  IS '������',
    REG_VAL      IS '������Ʈ����'
);

CREATE TABLE IN.T_RC_INI_INF
(
  ORG_CD varchar(3) NOT NULL,
  BRANCH_CD varchar(8) NOT NULL,
  MAC_NO varchar(12) NOT NULL,
  INI_FILE_NM varchar(260) NOT NULL,
  INI_SECT_NM varchar(32) NOT NULL,
  INI_KEY_NM varchar(64) NOT NULL,
  INSERT_UID varchar(10) NOT NULL,
  INSERT_DATE timestamp NOT NULL,
  UPDATE_UID varchar(10) NOT NULL,
  UPDATE_DATE timestamp NOT NULL,
  INI_VAL varchar(256),
  PRIMARY KEY (ORG_CD, BRANCH_CD, MAC_NO, INI_FILE_NM, INI_SECT_NM, INI_KEY_NM)
)
IN INFO_AMS01
INDEX IN INFO_AMSINDEX01;

ALTER TABLE IN.T_RC_INI_INF
  DATA CAPTURE NONE
  PCTFREE 0
  LOCKSIZE ROW
  APPEND OFF
  NOT VOLATILE;

COMMENT ON TABLE IN.T_RC_INI_INF IS '���INI����';

COMMENT ON IN.T_RC_INI_INF (
    ORG_CD      IS '����ڵ�',
    BRANCH_CD   IS '�����ڵ�',
    MAC_NO      IS '���',
    INI_FILE_NM IS 'INI���ϰ�� �� �̸�',
    INI_SECT_NM IS 'INI���Ǹ�',
    INI_KEY_NM  IS 'INIŰ��',
    INSERT_UID  IS '�����',
    INSERT_DATE IS '�����',
    UPDATE_UID  IS '������',
    UPDATE_DATE IS '������',
    INI_VAL     IS 'INI �׸� ��'
);

CREATE TABLE IN.T_RC_REG_INF_HIS
(
  ORG_CD varchar(3) NOT NULL,
  BRANCH_CD varchar(8) NOT NULL,
  MAC_NO varchar(12) NOT NULL,
  REG_BASE_KEY varchar(32) NOT NULL,
  REG_KEY_PATH varchar(260) NOT NULL,
  REG_KEY_NM varchar(64) NOT NULL,
  TRX_DATE varchar(8) NOT NULL,
  TRX_NO varchar(7) NOT NULL,
  INSERT_UID varchar(10) NOT NULL,
  INSERT_DATE timestamp NOT NULL,
  REG_VAL varchar(64),
  PRIMARY KEY (ORG_CD, BRANCH_CD, MAC_NO, REG_BASE_KEY, REG_KEY_PATH, REG_KEY_NM, TRX_DATE, TRX_NO)
)
IN INFO_AMS01
INDEX IN INFO_AMSINDEX01;

ALTER TABLE IN.T_RC_REG_INF_HIS
  DATA CAPTURE NONE
  PCTFREE 0
  LOCKSIZE ROW
  APPEND OFF
  NOT VOLATILE;

COMMENT ON TABLE IN.T_RC_REG_INF_HIS IS '��ⷹ����Ʈ�����������̷�';

COMMENT ON IN.T_RC_REG_INF_HIS (
    ORG_CD       IS '����ڵ�',
    BRANCH_CD    IS '�����ڵ�',
    MAC_NO       IS '���',
    REG_BASE_KEY IS '������Ʈ���⺻Ű',
    REG_KEY_PATH IS '������Ʈ��Ű���',
    REG_KEY_NM   IS '������Ʈ��Ű��',
    TRX_DATE     IS '�ŷ���',
    TRX_NO       IS '�ŷ���ȣ',
    INSERT_UID   IS '�����',
    INSERT_DATE  IS '�����',
    REG_VAL      IS '������Ʈ����'
);

CREATE TABLE IN.T_RC_INI_INF_HIS
(
  ORG_CD varchar(3) NOT NULL,
  BRANCH_CD varchar(8) NOT NULL,
  MAC_NO varchar(12) NOT NULL,
  INI_FILE_NM varchar(260) NOT NULL,
  INI_SECT_NM varchar(32) NOT NULL,
  INI_KEY_NM varchar(64) NOT NULL,
  TRX_DATE varchar(8) NOT NULL,
  TRX_NO varchar(7) NOT NULL,
  INSERT_UID varchar(10) NOT NULL,
  INSERT_DATE timestamp NOT NULL,
  INI_VAL varchar(256),
  PRIMARY KEY (ORG_CD, BRANCH_CD, MAC_NO, INI_FILE_NM, INI_SECT_NM, INI_KEY_NM, TRX_DATE, TRX_NO)
)
IN INFO_AMS01
INDEX IN INFO_AMSINDEX01;

ALTER TABLE IN.T_RC_INI_INF_HIS
  DATA CAPTURE NONE
  PCTFREE 0
  LOCKSIZE ROW
  APPEND OFF
  NOT VOLATILE;

COMMENT ON TABLE IN.T_RC_INI_INF_HIS IS '���INI���������̷�';

COMMENT ON IN.T_RC_INI_INF_HIS (
    ORG_CD      IS '����ڵ�',
    BRANCH_CD   IS '�����ڵ�',
    MAC_NO      IS '���',
    INI_FILE_NM IS 'INI���ϰ�� �� �̸�',
    INI_SECT_NM IS 'INI���Ǹ�',
    INI_KEY_NM  IS 'INIŰ��',
    TRX_DATE    IS '�ŷ���',
    TRX_NO      IS '�ŷ���ȣ',
    INSERT_UID  IS '�����',
    INSERT_DATE IS '�����',
    INI_VAL     IS 'INI �׸� ��'
);

CREATE TABLE IN.T_RM_FILE
(
  CREATE_DATE varchar(8) NOT NULL,
  FILE_SEQ varchar(7) NOT NULL,
  INSERT_DATE timestamp NOT NULL,
  INSERT_UID varchar(10) NOT NULL,
  UPDATE_DATE timestamp NOT NULL,
  UPDATE_UID varchar(10) NOT NULL,
  FILE_CL char NOT NULL,
  FILE_EXT varchar(5),
  ORG_FILE_NM varchar(80) NOT NULL,
  FILE_PATH varchar(260) NOT NULL,
  FILE_NM varchar(80) NOT NULL,
  COMPRSS_YN varchar(1),
  MAC_NO varchar(12),
  TRX_DATE varchar(8),
  TRX_NO varchar(7),
  PRIMARY KEY (CREATE_DATE, FILE_SEQ)
)
IN INFO_AMS01
INDEX IN INFO_AMSINDEX01;

ALTER TABLE IN.T_RM_FILE
  DATA CAPTURE NONE
  PCTFREE 0
  LOCKSIZE ROW
  APPEND OFF
  NOT VOLATILE;

COMMENT ON TABLE IN.T_RM_FILE IS '���ϰ�������';

COMMENT ON IN.T_RM_FILE (
    CREATE_DATE IS '������',
    FILE_SEQ    IS '���ϼ���',
    INSERT_DATE IS '�����',
    INSERT_UID  IS '�����',
    UPDATE_DATE IS '������',
    UPDATE_UID  IS '������',
    FILE_CL     IS '���Ϻз�',
    FILE_EXT    IS '����Ȯ���ڸ�',
    ORG_FILE_NM IS '�����ϸ�',
    FILE_PATH   IS '���ϰ��',
    FILE_NM     IS '���ϸ�',
    COMPRSS_YN  IS '���࿩��',
    MAC_NO      IS '����ȣ',
    TRX_DATE    IS '�ŷ���',
    TRX_NO      IS '�ŷ���ȣ'
);


CREATE TABLE IN.T_RM_FILE_HIS
(
  CREATE_DATE varchar(8) NOT NULL,
  FILE_SEQ varchar(7) NOT NULL,
  HIS_SEQ varchar(6) NOT NULL,
  INSERT_DATE timestamp NOT NULL,
  INSERT_UID varchar(10) NOT NULL,
  MAC_NO varchar(12),
  TRX_DATE varchar(8),
  TRX_NO varchar(7),
  ACT_CD varchar(8),
  PRIMARY KEY (CREATE_DATE, FILE_SEQ, HIS_SEQ)
)
IN INFO_AMS01
INDEX IN INFO_AMSINDEX01;

ALTER TABLE IN.T_RM_FILE_HIS
  DATA CAPTURE NONE
  PCTFREE 0
  LOCKSIZE ROW
  APPEND OFF
  NOT VOLATILE;

COMMENT ON TABLE IN.T_RM_FILE_HIS IS '���ϰ����̷�';

COMMENT ON IN.T_RM_FILE_HIS (
     CREATE_DATE IS '������',
     FILE_SEQ    IS '���ϼ���',
     HIS_SEQ     IS '�̷¼���',
     INSERT_DATE IS '�����',
     INSERT_UID  IS '�����',
     MAC_NO      IS '����ȣ',
     TRX_DATE    IS '�ŷ���',
     TRX_NO      IS '�ŷ���ȣ',
     ACT_CD      IS '�����ڵ�'
);

CREATE TABLE IN.T_PM_UPDS_GRP
(
  GRP_CD varchar(60) NOT NULL,
  INSERT_DATE timestamp NOT NULL,
  INSERT_UID varchar(10) NOT NULL,
  UPDATE_DATE timestamp NOT NULL,
  UPDATE_UID varchar(10) NOT NULL,
  STS char NOT NULL,
  GRP_NM varchar(60) NOT NULL,
  PGM_NM varchar(60),
  VERSION varchar(60),
  PRIMARY KEY (GRP_CD)
)
IN INFO_AMS01
INDEX IN INFO_AMSINDEX01;

ALTER TABLE IN.T_PM_UPDS_GRP
  DATA CAPTURE NONE
  PCTFREE 0
  LOCKSIZE ROW
  APPEND OFF
  NOT VOLATILE;

COMMENT ON TABLE IN.T_PM_UPDS_GRP IS '�����׷����';

COMMENT ON IN.T_PM_UPDS_GRP (
    GRP_CD      IS '�׷��ڵ�',
    INSERT_DATE IS '�����',
    INSERT_UID  IS '�����',
    UPDATE_DATE IS '������',
    UPDATE_UID  IS '������',
    STS         IS '����',
    GRP_NM      IS '�׷��',
    PGM_NM      IS '���α׷���',
    VERSION     IS '����'
);

CREATE TABLE IN.T_PM_UPDS_MAC
(
  GRP_CD varchar(60) NOT NULL,
  MAC_NO varchar(12) NOT NULL,
  INSERT_DATE timestamp NOT NULL,
  INSERT_UID varchar(10) NOT NULL,
  PRIMARY KEY (GRP_CD, MAC_NO)
)
IN INFO_AMS01
INDEX IN INFO_AMSINDEX01;

ALTER TABLE IN.T_PM_UPDS_MAC
  DATA CAPTURE NONE
  PCTFREE 0
  LOCKSIZE ROW
  APPEND OFF
  NOT VOLATILE;

COMMENT ON TABLE IN.T_PM_UPDS_MAC IS '����������';

COMMENT ON IN.T_PM_UPDS_MAC (
    GRP_CD      IS '�׷��ڵ�',
    MAC_NO      IS '����ȣ',
    INSERT_DATE IS '�����',
    INSERT_UID  IS '�����'
);

CREATE TABLE IN.T_PM_PGM
(
  PGM_NM varchar(60) NOT NULL,
  INSERT_DATE timestamp NOT NULL,
  INSERT_UID varchar(10) NOT NULL,
  UPDATE_DATE timestamp NOT NULL,
  UPDATE_UID varchar(10) NOT NULL,
  PRIMARY KEY (PGM_NM)
)
IN INFO_AMS01
INDEX IN INFO_AMSINDEX01;

ALTER TABLE IN.T_PM_PGM
  DATA CAPTURE NONE
  PCTFREE 0
  LOCKSIZE ROW
  APPEND OFF
  NOT VOLATILE;

COMMENT ON TABLE IN.T_PM_PGM IS '���α׷�����';

COMMENT ON IN.T_PM_PGM (
    PGM_NM      IS '���α׷���',
    INSERT_DATE IS '�����',
    INSERT_UID  IS '�����',
    UPDATE_DATE IS '������',
    UPDATE_UID  IS '������'
);


CREATE TABLE IN.T_PM_PGM_VER
(
  PGM_NM varchar(60) NOT NULL,
  VERSION varchar(60) NOT NULL,
  INSERT_DATE timestamp NOT NULL,
  INSERT_UID varchar(10) NOT NULL,
  DEPLOY_DATE varchar(8),
  DEPLOY_TIME varchar(6),
  CREATE_DATE varchar(8),
  FILE_SEQ varchar(7),
  PRIMARY KEY (PGM_NM, VERSION)
)
IN INFO_AMS01
INDEX IN INFO_AMSINDEX01;

ALTER TABLE IN.T_PM_PGM_VER
  DATA CAPTURE NONE
  PCTFREE 0
  LOCKSIZE ROW
  APPEND OFF
  NOT VOLATILE;

COMMENT ON TABLE IN.T_PM_PGM_VER IS '���ϰ����̷�';

COMMENT ON IN.T_PM_PGM_VER (
    PGM_NM      IS '���α׷���',
    VERSION     IS '����',
    INSERT_DATE IS '�����',
    INSERT_UID  IS '�����',
    DEPLOY_DATE IS '����������',
    DEPLOY_TIME IS '�������۽ð�',
    CREATE_DATE IS '������',
    FILE_SEQ    IS '���ϼ���'
);


CREATE TABLE IN.T_PM_MAC_STS
(
  MAC_NO varchar(12) NOT NULL,
  PGM_NM varchar(60) NOT NULL,
  VERSION varchar(60) NOT NULL,
  INSERT_DATE timestamp NOT NULL,
  INSERT_UID varchar(10) NOT NULL,
  UPDATE_DATE timestamp NOT NULL,
  UPDATE_UID varchar(10) NOT NULL,
  STS char NOT NULL,
  PRIMARY KEY (MAC_NO, PGM_NM, VERSION)
)
IN INFO_AMS01
INDEX IN INFO_AMSINDEX01;

ALTER TABLE IN.T_PM_MAC_STS
  DATA CAPTURE NONE
  PCTFREE 0
  LOCKSIZE ROW
  APPEND OFF
  NOT VOLATILE;

COMMENT ON TABLE IN.T_PM_MAC_STS IS '��⺰��������';

COMMENT ON IN.T_PM_MAC_STS (
    MAC_NO      IS '����ȣ',
    PGM_NM      IS '���α׷���',
    VERSION     IS '����',
    INSERT_DATE IS '�����',
    INSERT_UID  IS '�����',
    UPDATE_DATE IS '������',
    UPDATE_UID  IS '������',
    STS         IS '����'
);


/* Create Foreign Keys */

ALTER TABLE IN.T_RM_MSG_HIS
  ADD FOREIGN KEY (CREATE_DATE, MSG_SEQ)
  REFERENCES IN.T_RM_MSG (CREATE_DATE, MSG_SEQ)
  ON UPDATE RESTRICT
  ON DELETE RESTRICT;

ALTER TABLE IN.T_RM_MSG
  ADD FOREIGN KEY (TRX_DATE, TRX_NO)
  REFERENCES IN.T_RM_TRX (TRX_DATE, TRX_NO)
  ON UPDATE RESTRICT
  ON DELETE RESTRICT;

ALTER TABLE IN.T_RC_REG_INF_HIS
  ADD FOREIGN KEY (TRX_DATE, TRX_NO)
  REFERENCES IN.T_RM_TRX (TRX_DATE, TRX_NO)
  ON UPDATE RESTRICT
  ON DELETE RESTRICT;


ALTER TABLE IN.T_RC_INI_INF_HIS
  ADD FOREIGN KEY (TRX_DATE, TRX_NO)
  REFERENCES IN.T_RM_TRX (TRX_DATE, TRX_NO)
  ON UPDATE RESTRICT
  ON DELETE RESTRICT;

ALTER TABLE IN.T_RC_REG_INF
  ADD FOREIGN KEY (ORG_CD, BRANCH_CD, MAC_NO)
  REFERENCES IN.T_RM_MAC_ENV (ORG_CD, BRANCH_CD, MAC_NO)
  ON UPDATE RESTRICT
  ON DELETE RESTRICT;

ALTER TABLE IN.T_RC_INI_INF
  ADD FOREIGN KEY (ORG_CD, BRANCH_CD, MAC_NO)
  REFERENCES IN.T_RM_MAC_ENV (ORG_CD, BRANCH_CD, MAC_NO)
  ON UPDATE RESTRICT
  ON DELETE RESTRICT;

ALTER TABLE IN.T_RM_MAC_ENV_HIS
  ADD FOREIGN KEY (ORG_CD, BRANCH_CD, MAC_NO)
  REFERENCES IN.T_RM_MAC_ENV (ORG_CD, BRANCH_CD, MAC_NO)
  ON UPDATE RESTRICT
  ON DELETE RESTRICT;

ALTER TABLE IN.T_RC_REG_INF_HIS
  ADD FOREIGN KEY (ORG_CD, BRANCH_CD, MAC_NO, REG_BASE_KEY, REG_KEY_PATH, REG_KEY_NM)
  REFERENCES IN.T_RC_REG_INF (ORG_CD, BRANCH_CD, MAC_NO, REG_BASE_KEY, REG_KEY_PATH, REG_KEY_NM)
  ON UPDATE RESTRICT
  ON DELETE RESTRICT;

ALTER TABLE IN.T_RC_INI_INF_HIS
  ADD FOREIGN KEY (ORG_CD, BRANCH_CD, MAC_NO, INI_FILE_NM, INI_SECT_NM, INI_KEY_NM)
  REFERENCES IN.T_RC_INI_INF (ORG_CD, BRANCH_CD, MAC_NO, INI_FILE_NM, INI_SECT_NM, INI_KEY_NM)
  ON UPDATE RESTRICT
  ON DELETE RESTRICT;

ALTER TABLE IN.T_RM_MSG_HIS
  ADD FOREIGN KEY (CREATE_DATE, MSG_SEQ)
  REFERENCES IN.T_RM_MSG (CREATE_DATE, MSG_SEQ)
  ON UPDATE RESTRICT
  ON DELETE RESTRICT;

ALTER TABLE IN.T_RM_FILE
  ADD FOREIGN KEY (TRX_DATE, TRX_NO)
  REFERENCES IN.T_RM_TRX (TRX_DATE, TRX_NO)
  ON UPDATE RESTRICT
  ON DELETE RESTRICT;

ALTER TABLE IN.T_RM_FILE_HIS
  ADD FOREIGN KEY (TRX_DATE, TRX_NO)
  REFERENCES IN.T_RM_TRX (TRX_DATE, TRX_NO)
  ON UPDATE RESTRICT
  ON DELETE RESTRICT;

ALTER TABLE IN.T_PM_UPDS_MAC
  ADD FOREIGN KEY (GRP_CD)
  REFERENCES IN.T_PM_UPDS_GRP (GRP_CD)
  ON UPDATE RESTRICT
  ON DELETE RESTRICT;


ALTER TABLE IN.T_PM_PGM_VER
  ADD FOREIGN KEY (PGM_NM)
  REFERENCES IN.T_PM_PGM (PGM_NM)
  ON UPDATE RESTRICT
  ON DELETE RESTRICT;


ALTER TABLE IN.T_PM_UPDS_GRP
  ADD FOREIGN KEY (PGM_NM, VERSION)
  REFERENCES IN.T_PM_PGM_VER (PGM_NM, VERSION)
  ON UPDATE RESTRICT
  ON DELETE RESTRICT;

ALTER TABLE IN.T_PM_MAC_STS
  ADD FOREIGN KEY (PGM_NM, VERSION)
  REFERENCES IN.T_PM_PGM_VER (PGM_NM, VERSION)
  ON UPDATE RESTRICT
  ON DELETE RESTRICT;

ALTER TABLE IN.T_PM_PGM_VER
  ADD FOREIGN KEY (CREATE_DATE, FILE_SEQ)
  REFERENCES IN.T_RM_FILE (CREATE_DATE, FILE_SEQ)
  ON UPDATE RESTRICT
  ON DELETE RESTRICT;
