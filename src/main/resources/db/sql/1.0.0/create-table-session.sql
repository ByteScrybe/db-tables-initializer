CREATE TABLE SESSION
(
    ID           VARCHAR(36) NOT NULL,
    CHAPTER_ID   VARCHAR(36) NOT NULL,
    NAME         VARCHAR(64) NOT NULL,
    START_TIME   DATETIME    NOT NULL,
    END_TIME     DATETIME    NOT NULL,
    CREATED_BY   VARCHAR(32) NOT NULL,
    CREATED_DATE TIMESTAMP   NULL,
    UPDATED_BY   VARCHAR(32) NOT NULL,
    UPDATED_DATE TIMESTAMP   NOT NULL,
    PRIMARY KEY (ID, CHAPTER_ID),
    CONSTRAINT SESSION_NAME_UINDEX
        UNIQUE (NAME),
    CONSTRAINT SESSION_CHAPTER_ID_FK
        FOREIGN KEY (CHAPTER_ID) REFERENCES CHAPTER (ID)
);