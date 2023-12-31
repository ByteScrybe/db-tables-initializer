CREATE TABLE COUPON
(
    ID           VARCHAR(36)   NOT NULL,
    CODE         VARCHAR(128)  NOT NULL,
    DISCOUNT     DECIMAL(4, 2) NOT NULL,
    START_DATE   DATE          NOT NULL,
    END_DATE     DATE          NOT NULL,
    ACTIVE       CHAR          NULL,
    CREATED_BY   VARCHAR(32)   NULL,
    CREATED_DATE TIMESTAMP     NULL,
    UPDATED_BY   VARCHAR(32)   NULL,
    UPDATED_DATE TIMESTAMP     NULL,
    PRIMARY KEY (ID, CODE)
);