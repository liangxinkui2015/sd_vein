UPDATE vein.PERSON SET PERSON.EMPLOYEE_ID = PERSON.`NAME`;
UPDATE enterprise.`USER` SET USER.EMPLOYEE_ID = USER.`NAME`;

INSERT INTO exam.PERSON(ID, IDCARD, NAME, SEX,BIRTHDAY, CELLPHONE, EMPLOYEEID, ETAG ,CATEGORY) 
select A.ID, A.IDCARD, A.NAME, A.SEX_CD,A.BIRTHDAY, A.CELLPHONE,A.EMPLOYEE_ID,'0' ,B.NAME
from enterprise.USER AS A , enterprise.ORGANIZATION AS B
where A.ORGANIZATION_ID = B.ID 
AND ISDELETE = '1'
AND A.ID NOT in (
    SELECT ID
    from enterprise.USER 
    where ORGANIZATION_ID in (
            select ID 
            from enterprise.ORGANIZATION 
            where PARENT_ID in (select ID from enterprise.ORGANIZATION where PARENT_ID = (select ID from enterprise.ORGANIZATION where NAME = '家属区'))
            )
    or ORGANIZATION_ID in (
            select ID 
            from enterprise.ORGANIZATION 
            where PARENT_ID in (select ID from enterprise.ORGANIZATION where NAME = '家属区')
        )
);

INSERT INTO exam.FEATURE(ID, PERSON_ID, FINGER) select ID, USER_ID, FINGER from enterprise.FEATURE where USER_ID IN (SELECT ID FROM exam.PERSON);
