CREATE TABLE IDN_REMOTE_FETCH_CONFIG(
	ID VARCHAR(255) NOT NULL,
	TENANT_ID INTEGER NOT NULL,
	IS_ENABLED CHAR(1) NOT NULL,
	REPO_MANAGER_TYPE VARCHAR2(255) NOT NULL,
	ACTION_LISTENER_TYPE VARCHAR2(255) NOT NULL,
	CONFIG_DEPLOYER_TYPE VARCHAR2(255) NOT NULL,
	REMOTE_FETCH_NAME VARCHAR(255),
	REMOTE_RESOURCE_URI VARCHAR(255) NOT NULL,
	ATTRIBUTES_JSON CLOB NOT NULL,
	CONSTRAINT PK_IDN_REMOTE_FETCH_CONFIG PRIMARY KEY (ID),
	CONSTRAINT UC_REMOTE_RESOURCE_URI UNIQUE (TENANT_ID, REMOTE_RESOURCE_URI)
)/

CREATE TABLE IDN_REMOTE_FETCH_REVISIONS(
	ID VARCHAR(255) NOT NULL,
	CONFIG_ID VARCHAR(255) NOT NULL,
	FILE_PATH VARCHAR2(255) NOT NULL,
	FILE_HASH VARCHAR2(255),
	DEPLOYED_DATE DATE,
	SYNCED_DATE DATE,
	DEPLOYMENT_STATUS VARCHAR2(255),
	ITEM_NAME VARCHAR2(255),
	DEPLOY_ERR_LOG CLOB,
	CONSTRAINT PK_IDN_REMOTE_FETCH_REVISIONS PRIMARY KEY (ID),
	FOREIGN KEY (CONFIG_ID) REFERENCES IDN_REMOTE_FETCH_CONFIG (ID) ON DELETE CASCADE,
	CONSTRAINT UC_REVISIONS UNIQUE (CONFIG_ID, ITEM_NAME)
)/

-- IDN_REMOTE_FETCH_CONFIG --
CREATE INDEX IDX_REMOTE_FETCH_ID ON IDN_REMOTE_FETCH_CONFIG (TENANT_ID, ID)
/

