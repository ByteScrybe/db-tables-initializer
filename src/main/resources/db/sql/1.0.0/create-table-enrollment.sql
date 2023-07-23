CREATE TABLE ENROLLMENT
(
    ID                VARCHAR(36) NOT NULL,
    STUDENT_ID        VARCHAR(20) NOT NULL,
    COURSE_ID         VARCHAR(36) NOT NULL,
    ENROLLMENT_DATE   DATE        NOT NULL,
    ENROLLMENT_STATUS VARCHAR(16) NOT NULL,
    CREATED_BY        VARCHAR(32) NOT NULL,
    CREATED_DATE      TIMESTAMP   NULL,
    UPDATED_BY        VARCHAR(32) NULL,
    UPDATED_DATE      TIMESTAMP   NOT NULL,
    PRIMARY KEY (ID, COURSE_ID, STUDENT_ID),
    CONSTRAINT ENROLLMENT_COURSE_ID_FK
        FOREIGN KEY (COURSE_ID) REFERENCES COURSE (ID),
    CONSTRAINT ENROLLMENT_STUDENT_STUDENT_ID_FK
        FOREIGN KEY (STUDENT_ID) REFERENCES STUDENT (STUDENT_ID)
);