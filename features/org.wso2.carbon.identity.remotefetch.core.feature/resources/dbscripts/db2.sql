CREATE TABLE IDN_REMOTE_FETCH_CONFIG(
	ID VARCHAR(255) NOT NULL,
    TENANT_ID INTEGER NOT NULL,
	IS_ENABLED CHAR(1) NOT NULL,
    REPO_MANAGER_TYPE VARCHAR(255) NOT NULL,
    ACTION_LISTENER_TYPE VARCHAR(255) NOT NULL,
    CONFIG_DEPLOYER_TYPE VARCHAR(255) NOT NULL,
    REMOTE_FETCH_NAME VARCHAR(255),
    REMOTE_RESOURCE_URI VARCHAR(255) NOT NULL,
    ATTRIBUTES_JSON CLOB NOT NULL,
    PRIMARY KEY (ID),
    CONSTRAINT UC_REMOTE_RESOURCE_URI UNIQUE (TENANT_ID, REMOTE_RESOURCE_URI)
    )
/

CREATE TABLE IDN_REMOTE_FETCH_REVISIONS (
	ID VARCHAR(255) NOT NULL,
	CONFIG_ID VARCHAR(255) NOT NULL,
	FILE_PATH VARCHAR(255) NOT NULL,
	FILE_HASH VARCHAR(255),
	DEPLOYED_DATE TIMESTAMP,
	SYNCED_DATE TIMESTAMP,
	DEPLOYMENT_STATUS VARCHAR(255),
	ITEM_NAME VARCHAR(255) NOT NULL,
	DEPLOY_ERR_LOG CLOB,
	PRIMARY KEY (ID),
	FOREIGN KEY (CONFIG_ID) REFERENCES IDN_REMOTE_FETCH_CONFIG(ID) ON DELETE CASCADE,
	CONSTRAINT UC_REVISIONS UNIQUE (CONFIG_ID,ITEM_NAME)
)
/
-- IDN_REMOTE_FETCH_CONFIG --
CREATE INDEX IDX_REMOTE_FETCH_ID ON IDN_REMOTE_FETCH_CONFIG (TENANT_ID, ID)
/

