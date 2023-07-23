CREATE TABLE TUTOR_FEEDBACK
(
    ID           VARCHAR(36) NOT NULL PRIMARY KEY,
    TUTOR_ID     VARCHAR(20) NOT NULL,
    STUDENT_ID   VARCHAR(20) NOT NULL,
    FEEDBACK     TEXT        NOT NULL,
    CREATED_BY   VARCHAR(32) NOT NULL,
    CREATED_DATE TIMESTAMP   NOT NULL,
    UPDATED_BY   VARCHAR(32) NOT NULL,
    UPDATED_DATE TIMESTAMP   NOT NULL,
    CONSTRAINT TUTOR_FEEDBACK_TUTOR_ID_UINDEX
        UNIQUE (TUTOR_ID),
    CONSTRAINT TUTOR_FEEDBACK_STUDENT_STUDENT_ID_FK
        FOREIGN KEY (STUDENT_ID) REFERENCES STUDENT (STUDENT_ID),
    CONSTRAINT TUTOR_FEEDBACK_TUTOR_TUTOR_ID_FK
        FOREIGN KEY (TUTOR_ID) REFERENCES TUTOR (TUTOR_ID)
);