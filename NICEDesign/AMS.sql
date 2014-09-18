
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
DROP TABLE IN.T_PM_UPDS_SCHED;
DROP TABLE IN.T_PM_UPDS_GRP;
DROP TABLE IN.T_PM_MAC_STS;
DROP TABLE IN.T_PM_PGM_VER;
DROP TABLE IN.T_JM_TRX;
DROP TABLE IN.T_JM_FILE;




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

COMMENT ON TABLE IN.T_RM_MAC_ENV IS '기기환경';

COMMENT ON IN.T_RM_MAC_ENV (
    ORG_CD               IS '기관코드',
    BRANCH_CD            IS '지점코드',
    MAC_NO               IS '기번',
    INSERT_UID           IS '등록자',
    INSERT_DATE          IS '등록일',
    UPDATE_UID           IS '수정자',
    UPDATE_DATE          IS '수정일',
    STS                  IS '상태',
    SITE_CD              IS '사이트코드',
    DEPT_CD              IS '부서코드',
    OFFICE_CD            IS '사무소코드',
    TEAM_CD              IS '지소코드',
    PRDC_NO              IS '기기제조번호',
    MKR_CD               IS '제조사코드',
    MODEL_CD             IS '기종코드',
    AP_VER               IS '프로그램버전',
    SET_PLACE            IS '설치장소',
    PUB_IP_ADDR          IS 'ATM IP주소1',
    PRI_IP_ADDR          IS 'ATM IP주소2',
    IP_PORT              IS 'ATM IP 포트',
    HOST_IP_ADDR         IS 'HOST IP 주소',
    HOST_IP_PORT         IS 'HOST IP 포트',
    AOC_IP_ADDR          IS 'AOC IP 주소',
    AOC_IP_PORT          IS 'AOC IP 포트',
    REBOOT_TIME          IS '리부팅 예약시간',
    MAC_OS               IS 'OS',
    MAC_CPU              IS 'CPU',
    MAC_MEM              IS 'Memory',
    MAC_HDD              IS 'HDD',
    MODEM_RELAY_YN       IS '모뎀릴레이사용여부',
    RPC_YN               IS 'RPC사용여부',
    CREDIT_CARD_YN       IS '신용카드 거래',
    CARD_LOAN_YN         IS '카드론 거래',
    CHRG_HIPASS_YN       IS '하이패스충전사용여부',
    FRGN_TRAN_TYPE       IS '해외카드거래 종류설정',
    OUR_MAX_WDR_AMT      IS '자행최대출금가능금액',
    THR_MAX_WDR_AMT      IS '타행최대출금가능금액',
    OUR_MAX_DPS_AMT      IS '자행최대입금금액',
    THR_MAX_DPS_AMT      IS '타행최대입금금액',
    OUR_MAX_TSF_AMT      IS '자행최대이체금액',
    THR_MAX_TSF_AMT      IS '타행최대이체금액',
    MAX_SVC_WDR_AMT      IS '최대서비스출금가능금액',
    MAX_CASH_WDR_CNT     IS '최대출금가능현금매수',
    MAX_CASH_DPS_CNT     IS '최대입금가능현금매수',
    MAX_CASH_SVC_WDR_CNT IS '최대서비스출금가능현금매수'
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

COMMENT ON TABLE IN.T_RM_MAC_ENV_HIS IS '기기환경이력';

COMMENT ON IN.T_RM_MAC_ENV_HIS (
    ORG_CD               IS '기관코드',
    BRANCH_CD            IS '지점코드',
    MAC_NO               IS '기번',
    TRX_DATE             IS '거래일',
    TRX_NO               IS '거래번호',
    INSERT_UID           IS '등록자',
    INSERT_DATE          IS '등록일',
    STS                  IS '상태',
    SITE_CD              IS '사이트코드',
    DEPT_CD              IS '부서코드',
    OFFICE_CD            IS '사무소코드',
    TEAM_CD              IS '지소코드',
    PRDC_NO              IS '기기제조번호',
    MKR_CD               IS '제조사코드',
    MODEL_CD             IS '기종코드',
    AP_VER               IS '프로그램버전',
    SET_PLACE            IS '설치장소',
    PUB_IP_ADDR          IS 'ATM IP주소1',
    PRI_IP_ADDR          IS 'ATM IP주소2',
    IP_PORT              IS 'ATM IP 포트',
    HOST_IP_ADDR         IS 'HOST IP 주소',
    HOST_IP_PORT         IS 'HOST IP 포트',
    AOC_IP_ADDR          IS 'AOC IP 주소',
    AOC_IP_PORT          IS 'AOC IP 포트',
    REBOOT_TIME          IS '리부팅 예약시간',
    MAC_OS               IS 'OS',
    MAC_CPU              IS 'CPU',
    MAC_MEM              IS 'Memory',
    MAC_HDD              IS 'HDD',
    MODEM_RELAY_YN       IS '모뎀릴레이사용여부',
    RPC_YN               IS 'RPC사용여부',
    CREDIT_CARD_YN       IS '신용카드 거래',
    CARD_LOAN_YN         IS '카드론 거래',
    CHRG_HIPASS_YN       IS '하이패스충전사용여부',
    FRGN_TRAN_TYPE       IS '해외카드거래 종류설정',
    OUR_MAX_WDR_AMT      IS '자행최대출금가능금액',
    THR_MAX_WDR_AMT      IS '타행최대출금가능금액',
    OUR_MAX_DPS_AMT      IS '자행최대입금금액',
    THR_MAX_DPS_AMT      IS '타행최대입금금액',
    OUR_MAX_TSF_AMT      IS '자행최대이체금액',
    THR_MAX_TSF_AMT      IS '타행최대이체금액',
    MAX_SVC_WDR_AMT      IS '최대서비스출금가능금액',
    MAX_CASH_WDR_CNT     IS '최대출금가능현금매수',
    MAX_CASH_DPS_CNT     IS '최대입금가능현금매수',
    MAX_CASH_SVC_WDR_CNT IS '최대서비스출금가능현금매수'
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

COMMENT ON TABLE IN.T_RM_COMMON IS '공통코드';

COMMENT ON IN.T_RM_COMMON (
    LCD         IS '대분류',
    MCD         IS '중분류',
    SCD         IS '소분류',
    INSERT_DATE IS '등록일',
    INSERT_UID  IS '등록자',
    UPDATE_DATE IS '수정일',
    UPDATE_UID  IS '수정자',
    CD_NM       IS '분류명',
    CD_NM1      IS '세부사항1',
    CD_NM2      IS '세부사항2',
    CD_NM3      IS '세부사항3',
    CD_NM4      IS '세부사항4',
    CD_NM5      IS '세부사항5',
    CD_NM6      IS '세부사항6'
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

COMMENT ON TABLE IN.T_RM_TRX IS '거래내역';

COMMENT ON IN.T_RM_TRX (
    TRX_DATE IS '거래일',
    TRX_NO   IS '거래번호',
    TRX_TIME IS '거래시간',
    TRX_CD   IS '거래코드',
    TRX_UID  IS '거래자',
    ACT_CD   IS '실행코드'
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

COMMENT ON TABLE IN.T_RM_MSG IS '전문원장';

COMMENT ON IN.T_RM_MSG (
    CREATE_DATE IS '전문생성일',
    MSG_SEQ     IS '전문순번',
    CREATE_TIME IS '전문생성시간',
    INSERT_UID  IS '등록자',
    INSERT_DATE IS '등록일',
    UPDATE_UID  IS '수정자',
    UPDATE_DATE IS '수정일',
    MAC_NO      IS '기기번호',
    MAC_MSG_SEQ IS '기기전문순번',
    IO_CL       IS 'IO구분',
    MSG_STS     IS '전문상태',
    MSG_TYPE    IS '메세지타입',
    MSG_CD      IS '메세지코드',
    SVC_CD      IS '서비스코드',
    MAC_SER_NO  IS '기기일련번호',
    BRANCH_CD   IS '지점코드',
    ORG_CD      IS '기관코드',
    TRX_DATE    IS '거래일',
    TRX_NO      IS '거래번호'
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


COMMENT ON TABLE IN.T_RM_MSG_HIS IS '전문처리이력';

COMMENT ON IN.T_RM_MSG_HIS (
    CREATE_DATE IS '전문생성일',
    MSG_SEQ     IS '전문순번',
    HIS_SEQ     IS '이력순번',
    CREATE_TIME IS '전문생성시간',
    INSERT_UID  IS '등록자',
    INSERT_DATE IS '등록일',
    MAC_NO      IS '기기번호',
    MAC_MSG_SEQ IS '기기전문순번',
    MSG_STS     IS '전문상태',
    MSG_TYPE    IS '메세지타입',
    MSG_CD      IS '메세지코드',
    SVC_CD      IS '서비스코드',
    MAC_SER_NO  IS '기기일련번호',
    BRANCH_CD   IS '지점코드',
    ORG_CD      IS '기관코드',
    MSG_CTX     IS '전문내용'
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

COMMENT ON TABLE IN.T_RC_REG_INF IS '기기레지스트리정보';

COMMENT ON IN.T_RC_REG_INF (
    ORG_CD       IS '기관코드',
    BRANCH_CD    IS '지점코드',
    MAC_NO       IS '기번',
    REG_BASE_KEY IS '레지스트리기본키',
    REG_KEY_PATH IS '레지스트리키경로',
    REG_KEY_NM   IS '레지스트리키명',
    INSERT_UID   IS '등록자',
    INSERT_DATE  IS '등록일',
    UPDATE_UID   IS '수정자',
    UPDATE_DATE  IS '수정일',
    REG_VAL      IS '레지스트리값'
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

COMMENT ON TABLE IN.T_RC_INI_INF IS '기기INI정보';

COMMENT ON IN.T_RC_INI_INF (
    ORG_CD      IS '기관코드',
    BRANCH_CD   IS '지점코드',
    MAC_NO      IS '기번',
    INI_FILE_NM IS 'INI파일경로 및 이름',
    INI_SECT_NM IS 'INI섹션명',
    INI_KEY_NM  IS 'INI키명',
    INSERT_UID  IS '등록자',
    INSERT_DATE IS '등록일',
    UPDATE_UID  IS '수정자',
    UPDATE_DATE IS '수정일',
    INI_VAL     IS 'INI 항목 값'
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

COMMENT ON TABLE IN.T_RC_REG_INF_HIS IS '기기레지스트리정보변경이력';

COMMENT ON IN.T_RC_REG_INF_HIS (
    ORG_CD       IS '기관코드',
    BRANCH_CD    IS '지점코드',
    MAC_NO       IS '기번',
    REG_BASE_KEY IS '레지스트리기본키',
    REG_KEY_PATH IS '레지스트리키경로',
    REG_KEY_NM   IS '레지스트리키명',
    TRX_DATE     IS '거래일',
    TRX_NO       IS '거래번호',
    INSERT_UID   IS '등록자',
    INSERT_DATE  IS '등록일',
    REG_VAL      IS '레지스트리값'
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

COMMENT ON TABLE IN.T_RC_INI_INF_HIS IS '기기INI정보변경이력';

COMMENT ON IN.T_RC_INI_INF_HIS (
    ORG_CD      IS '기관코드',
    BRANCH_CD   IS '지점코드',
    MAC_NO      IS '기번',
    INI_FILE_NM IS 'INI파일경로 및 이름',
    INI_SECT_NM IS 'INI섹션명',
    INI_KEY_NM  IS 'INI키명',
    TRX_DATE    IS '거래일',
    TRX_NO      IS '거래번호',
    INSERT_UID  IS '등록자',
    INSERT_DATE IS '등록일',
    INI_VAL     IS 'INI 항목 값'
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

COMMENT ON TABLE IN.T_RM_FILE IS '파일관리원장';

COMMENT ON IN.T_RM_FILE (
    CREATE_DATE IS '생성일',
    FILE_SEQ    IS '파일순번',
    INSERT_DATE IS '등록일',
    INSERT_UID  IS '등록자',
    UPDATE_DATE IS '수정일',
    UPDATE_UID  IS '수정자',
    FILE_CL     IS '파일분류',
    FILE_EXT    IS '파일확장자명',
    ORG_FILE_NM IS '원파일명',
    FILE_PATH   IS '파일경로',
    FILE_NM     IS '파일명',
    COMPRSS_YN  IS '압축여부',
    MAC_NO      IS '기기번호',
    TRX_DATE    IS '거래일',
    TRX_NO      IS '거래번호'
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

COMMENT ON TABLE IN.T_RM_FILE_HIS IS '파일관리이력';

COMMENT ON IN.T_RM_FILE_HIS (
     CREATE_DATE IS '생성일',
     FILE_SEQ    IS '파일순번',
     HIS_SEQ     IS '이력순번',
     INSERT_DATE IS '등록일',
     INSERT_UID  IS '등록자',
     MAC_NO      IS '기기번호',
     TRX_DATE    IS '거래일',
     TRX_NO      IS '거래번호',
     ACT_CD      IS '실행코드'
);

CREATE TABLE IN.T_PM_UPDS_GRP
(
  GRP_CD varchar(60) NOT NULL,
  INSERT_DATE timestamp NOT NULL,
  INSERT_UID varchar(10) NOT NULL,
  UPDATE_DATE timestamp NOT NULL,
  UPDATE_UID varchar(10) NOT NULL,
  STS char NOT NULL,
  GRP_RMK varchar(80),
  MKR_CD varchar(4) NOT NULL,
  MODEL_CD varchar(4) NOT NULL,
  VER_ID varchar(60),
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

COMMENT ON TABLE IN.T_PM_UPDS_GRP IS '배포그룹관리';

COMMENT ON IN.T_PM_UPDS_GRP (
    GRP_CD      IS '그룹코드',
    INSERT_DATE IS '등록일',
    INSERT_UID  IS '등록자',
    UPDATE_DATE IS '수정일',
    UPDATE_UID  IS '수정자',
    STS         IS '상태',
    GRP_RMK     IS '그룹설명',
    MKR_CD      IS '제조사코드',
    MODEL_CD    IS '기종코드',
    VER_ID      IS '버전ID'
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

COMMENT ON TABLE IN.T_PM_UPDS_MAC IS '배포기기관리';

COMMENT ON IN.T_PM_UPDS_MAC (
    GRP_CD      IS '그룹코드',
    MAC_NO      IS '기기번호',
    INSERT_DATE IS '등록일',
    INSERT_UID  IS '등록자'
);

CREATE TABLE IN.T_PM_PGM_VER
(
  MKR_CD varchar(4) NOT NULL,
  MODEL_CD varchar(4) NOT NULL,
  VER_ID varchar(60) NOT NULL,
  INSERT_DATE timestamp NOT NULL,
  INSERT_UID varchar(10) NOT NULL,
  DEP_VER_ID varchar(60),
  SORT_ID varchar(8),
  MASTER_YN char(1) NOT NULL,
  CREATE_DATE varchar(8),
  FILE_SEQ varchar(7),
  PRIMARY KEY (VER_ID)
)
IN INFO_AMS01
INDEX IN INFO_AMSINDEX01;

ALTER TABLE IN.T_PM_PGM_VER
  DATA CAPTURE NONE
  PCTFREE 0
  LOCKSIZE ROW
  APPEND OFF
  NOT VOLATILE;

COMMENT ON TABLE IN.T_PM_PGM_VER IS '프로그램버전관리';

COMMENT ON IN.T_PM_PGM_VER (
    MKR_CD      IS '제조사코드',
    MODEL_CD    IS '기종코드',
    VER_ID      IS '버전ID',
    INSERT_DATE IS '등록일',
    INSERT_UID  IS '등록자',
    DEP_VER_ID  IS '종속버전ID',
    SORT_ID     IS '순서정렬ID',
    MASTER_YN   IS '마스터여부',
    CREATE_DATE IS '생성일',
    FILE_SEQ    IS '파일순번'
);


CREATE TABLE IN.T_PM_MAC_STS
(
  MAC_NO varchar(12) NOT NULL,
  MKR_CD varchar(4) NOT NULL,
  MODEL_CD varchar(4) NOT NULL,
  VER_ID varchar(60) NOT NULL,
  INSERT_DATE timestamp NOT NULL,
  INSERT_UID varchar(10) NOT NULL,
  UPDATE_DATE timestamp NOT NULL,
  UPDATE_UID varchar(10) NOT NULL,
  STS char NOT NULL,
  PRIMARY KEY (MAC_NO, MKR_CD, MODEL_CD, VER_ID)
)
IN INFO_AMS01
INDEX IN INFO_AMSINDEX01;

ALTER TABLE IN.T_PM_MAC_STS
  DATA CAPTURE NONE
  PCTFREE 0
  LOCKSIZE ROW
  APPEND OFF
  NOT VOLATILE;

COMMENT ON TABLE IN.T_PM_MAC_STS IS '기기별배포상태';

COMMENT ON IN.T_PM_MAC_STS (
    MAC_NO      IS '기기번호',
    MKR_CD      IS '제조사코드',
    MODEL_CD    IS '기종코드',
    VER_ID      IS '버전ID',
    INSERT_DATE IS '등록일',
    INSERT_UID  IS '등록자',
    UPDATE_DATE IS '수정일',
    UPDATE_UID  IS '수정자',
    STS         IS '상태'
);

CREATE TABLE IN.T_PM_UPDS_SCHED
(
  GRP_CD varchar(60) NOT NULL,
  MKR_CD varchar(4) NOT NULL,
  MODEL_CD varchar(4) NOT NULL,
  VER_ID varchar(60) NOT NULL,
  INSERT_DATE timestamp NOT NULL,
  INSERT_UID varchar(10) NOT NULL,
  UPDATE_DATE timestamp NOT NULL,
  UPDATE_UID varchar(10) NOT NULL,
  DEPLOY_DATE varchar(8),
  DEPLOY_TIME varchar(6),
  PRIMARY KEY (GRP_CD, MKR_CD, MODEL_CD, VER_ID)
)
IN INFO_AMS01
INDEX IN INFO_AMSINDEX01;

ALTER TABLE IN.T_PM_UPDS_SCHED
  DATA CAPTURE NONE
  PCTFREE 0
  LOCKSIZE ROW
  APPEND OFF
  NOT VOLATILE;

COMMENT ON TABLE IN.T_PM_UPDS_SCHED IS '배포일정관리';

COMMENT ON IN.T_PM_UPDS_SCHED (
    GRP_CD      IS '그룹코드',
    MKR_CD      IS '제조사코드',
    MODEL_CD    IS '기종코드',
    VER_ID      IS '버전ID',
    INSERT_DATE IS '등록일',
    INSERT_UID  IS '등록자',
    UPDATE_DATE IS '수정일',
    UPDATE_UID  IS '수정자',
    DEPLOY_DATE IS '배포시작일',
    DEPLOY_TIME IS '배포시작시간'
);

CREATE TABLE IN.T_JM_TRX
(
  MAC_TRX_DATE varchar(8) NOT NULL,
  MAC_TRX_TIME varchar(6) NOT NULL,
  ORG_CD varchar(3) NOT NULL,
  BRANCH_CD varchar(8) NOT NULL,
  MAC_NO varchar(12) NOT NULL,
  INSERT_DATE timestamp NOT NULL,
  INSERT_UID varchar(10) NOT NULL,
  TRX_CL varchar(4),
  TRX_ORG_CD varchar(3),
  TRX_SEQ_NO varchar(6),
  TRX_MD_CD varchar(2),
  TRX_ACCT_NO varchar(16),
  TRSF_ACCT_NO varchar(16),
  TRX_AMT decimal(12),
  TRX_FEE decimal(6),
  BAL_AMT decimal(12),
  HOST_SEQ_NO varchar(12),
  HOST_RESP_CD varchar(5),
  PROC_CNT decimal(2),
  TRX_NOTE1_CNT decimal(3),
  TRX_NOTE2_CNT decimal(3),
  TRX_NOTE3_CNT decimal(3),
  TRX_NOTE4_CNT decimal(3),
  TRX_NOTE5_CNT decimal(3),
  TRX_NOTE6_CNT decimal(3),
  TRX_NOTE7_CNT decimal(3),
  TRX_NOTE8_CNT decimal(3),
  TRX_NOTE9_CNT decimal(3),
  TRX_NOTE10_CNT decimal(3),
  TRX_RSLT varchar(64),
  ERR_CD varchar(4),
  MD_TKN_YN varchar(1),
  ITM_TKN_YN varchar(1),
  TRX_IMG1_NM varchar(64),
  TRX_IMG2_NM varchar(64),
  TRX_IMG3_NM varchar(64),
  TRX_IMG4_NM varchar(64),
  TRX_IMG5_NM varchar(64),
  TRX_IMG6_NM varchar(64),
  TRX_IMG7_NM varchar(64),
  TRX_IMG8_NM varchar(64),
  TRX_IMG9_NM varchar(64),
  TRX_IMG10_NM varchar(64),
  ETC1 varchar(8),
  ETC2 varchar(8),
  ETC3 varchar(8),
  ETC4 varchar(8),
  ETC5 varchar(8),
  PRIMARY KEY (MAC_TRX_DATE, MAC_TRX_TIME, ORG_CD, BRANCH_CD, MAC_NO)
)
IN INFO_AMS01
INDEX IN INFO_AMSINDEX01;

ALTER TABLE IN.T_JM_TRX
  DATA CAPTURE NONE
  PCTFREE 0
  LOCKSIZE ROW
  APPEND OFF
  NOT VOLATILE;

COMMENT ON TABLE IN.T_JM_TRX IS '저널거래원장';

COMMENT ON IN.T_JM_TRX (
    MAC_TRX_DATE   IS '기기거래일자',
    MAC_TRX_TIME   IS '기기거래시간',
    ORG_CD         IS '기관코드',
    BRANCH_CD      IS '지점코드',
    MAC_NO         IS '기기번호',
    INSERT_DATE    IS '등록일',
    INSERT_UID     IS '등록자',
    TRX_CL         IS '거래종류',
    TRX_ORG_CD     IS '거래기관코드',
    TRX_SEQ_NO     IS '거래일련번호',
    TRX_MD_CD      IS '거래매체코드',
    TRX_ACCT_NO    IS '거래계좌번호',
    TRSF_ACCT_NO   IS '이체계좌번호',
    TRX_AMT        IS '거래금액',
    TRX_FEE        IS '거래수수료',
    BAL_AMT        IS '잔액',
    HOST_SEQ_NO    IS '호스트거래일련번호',
    HOST_RESP_CD   IS '호스트응답코드',
    PROC_CNT       IS '진행카운트',
    TRX_NOTE1_CNT  IS '권종1 거래매수',
    TRX_NOTE2_CNT  IS '권종2 거래매수',
    TRX_NOTE3_CNT  IS '권종3 거래매수',
    TRX_NOTE4_CNT  IS '권종4 거래매수',
    TRX_NOTE5_CNT  IS '권종5 거래매수',
    TRX_NOTE6_CNT  IS '권종6 거래매수',
    TRX_NOTE7_CNT  IS '권종7 거래매수',
    TRX_NOTE8_CNT  IS '권종8 거래매수',
    TRX_NOTE9_CNT  IS '권종9 거래매수',
    TRX_NOTE10_CNT IS '권종10 거래매수',
    TRX_RSLT       IS '거래결과',
    ERR_CD         IS '에러코드',
    MD_TKN_YN      IS '매체수취여부',
    ITM_TKN_YN     IS '시재수취여부',
    TRX_IMG1_NM    IS '이미지파일1 이름',
    TRX_IMG2_NM    IS '이미지파일2 이름',
    TRX_IMG3_NM    IS '이미지파일3 이름',
    TRX_IMG4_NM    IS '이미지파일4 이름',
    TRX_IMG5_NM    IS '이미지파일5 이름',
    TRX_IMG6_NM    IS '이미지파일6 이름',
    TRX_IMG7_NM    IS '이미지파일7 이름',
    TRX_IMG8_NM    IS '이미지파일8 이름',
    TRX_IMG9_NM    IS '이미지파일9 이름',
    TRX_IMG10_NM   IS '이미지파일10 이름',
    ETC1           IS '기타1',
    ETC2           IS '기타2',
    ETC3           IS '기타3',
    ETC4           IS '기타4',
    ETC5           IS '기타5'
);

CREATE TABLE IN.T_JM_FILE
(
  MAC_TRX_DATE varchar(8) NOT NULL,
  ORG_CD varchar(3) NOT NULL,
  BRANCH_CD varchar(8) NOT NULL,
  MAC_NO varchar(12) NOT NULL,
  FILE_NAME varchar(260) NOT NULL,
  INSERT_DATE timestamp,
  INSERT_UID varchar(10),
  FILE_PATH varchar(260),
  PRIMARY KEY (MAC_TRX_DATE, ORG_CD, BRANCH_CD, MAC_NO, FILE_NAME)
)
IN INFO_AMS01
INDEX IN INFO_AMSINDEX01;

ALTER TABLE IN.T_JM_FILE
  DATA CAPTURE NONE
  PCTFREE 0
  LOCKSIZE ROW
  APPEND OFF
  NOT VOLATILE;

COMMENT ON TABLE IN.T_JM_FILE IS '저널파일관리';

COMMENT ON IN.T_JM_FILE (
    MAC_TRX_DATE IS '기기거래일자',
    ORG_CD       IS '기관코드',
    BRANCH_CD    IS '지점코드',
    MAC_NO       IS '기번',
    FILE_NAME    IS '파일명',
    INSERT_DATE  IS '등록일',
    INSERT_UID   IS '등록자',
    FILE_PATH    IS '파일경로'
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

ALTER TABLE IN.T_PM_PGM_VER
  ADD FOREIGN KEY (CREATE_DATE, FILE_SEQ)
  REFERENCES IN.T_RM_FILE (CREATE_DATE, FILE_SEQ)
  ON UPDATE RESTRICT
  ON DELETE RESTRICT;

ALTER TABLE IN.T_PM_UPDS_MAC
  ADD FOREIGN KEY (GRP_CD)
  REFERENCES IN.T_PM_UPDS_GRP (GRP_CD)
  ON UPDATE RESTRICT
  ON DELETE RESTRICT;

ALTER TABLE IN.T_PM_UPDS_SCHED
  ADD FOREIGN KEY (GRP_CD)
  REFERENCES IN.T_PM_UPDS_GRP (GRP_CD)
  ON UPDATE RESTRICT
  ON DELETE RESTRICT;

ALTER TABLE IN.T_PM_UPDS_GRP
  ADD FOREIGN KEY (MKR_CD, MODEL_CD, VER_ID)
  REFERENCES IN.T_PM_PGM_VER (MKR_CD, MODEL_CD, VER_ID)
  ON UPDATE RESTRICT
  ON DELETE RESTRICT;

ALTER TABLE IN.T_PM_UPDS_SCHED
  ADD FOREIGN KEY (MKR_CD, MODEL_CD, VER_ID)
  REFERENCES IN.T_PM_PGM_VER (MKR_CD, MODEL_CD, VER_ID)
  ON UPDATE RESTRICT
  ON DELETE RESTRICT;

ALTER TABLE IN.T_PM_MAC_STS
  ADD FOREIGN KEY (MKR_CD, MODEL_CD, VER_ID)
  REFERENCES IN.T_PM_PGM_VER (MKR_CD, MODEL_CD, VER_ID)
  ON UPDATE RESTRICT
  ON DELETE RESTRICT;

ALTER TABLE IN.T_JM_TRX
  ADD FOREIGN KEY (ORG_CD, BRANCH_CD, MAC_NO)
  REFERENCES IN.T_RM_MAC_ENV (ORG_CD, BRANCH_CD, MAC_NO)
  ON UPDATE RESTRICT
  ON DELETE RESTRICT;

ALTER TABLE IN.T_JM_FILE
  ADD FOREIGN KEY (ORG_CD, BRANCH_CD, MAC_NO)
  REFERENCES IN.T_RM_MAC_ENV (ORG_CD, BRANCH_CD, MAC_NO)
  ON UPDATE RESTRICT
  ON DELETE RESTRICT;

