/*
 * 도시, 부서명, 이름, 성을 조회.
 */
SELECT LOC.CITY 
     , DEP.DEPARTMENT_NAME 
     , EMP.FIRST_NAME 
     , EMP.LAST_NAME 
  FROM EMPLOYEES EMP
 INNER JOIN DEPARTMENTS DEP
    ON EMP.DEPARTMENT_ID = DEP.DEPARTMENT_ID 
 INNER JOIN LOCATIONS LOC
    ON DEP.LOCATION_ID = LOC.LOCATION_ID 
;

/*
 * 'Canada' 에 근무하는 사원의 이름과 부서명을 조회.
 */
SELECT EMP.FIRST_NAME 
	 , DEP.DEPARTMENT_NAME 
  FROM EMPLOYEES EMP
 INNER JOIN DEPARTMENTS DEP
    ON EMP.DEPARTMENT_ID = DEP.DEPARTMENT_ID 
 INNER JOIN LOCATIONS LOC
    ON DEP.LOCATION_ID = LOC.LOCATION_ID 
 INNER JOIN COUNTRIES COU
    ON LOC.COUNTRY_ID = COU.COUNTRY_ID 
 WHERE COU.COUNTRY_NAME = 'Canada'
;

/*
 * 'SA_REP' 직무인 사원의 
 * 이름, 성, 연봉, 부서명, 직무명을 조회
 */
SELECT EMP.FIRST_NAME 
     , EMP.LAST_NAME 
     , EMP.SALARY 
     , DEP.DEPARTMENT_NAME 
     , JOB.JOB_TITLE 
  FROM EMPLOYEES EMP
 INNER JOIN JOBS JOB
    ON JOB.JOB_ID = EMP.JOB_ID
 INNER JOIN DEPARTMENTS DEP
    ON EMP.DEPARTMENT_ID = DEP.DEPARTMENT_ID 
 WHERE JOB.JOB_ID = 'SA_REP'
;
/*
 * 'MK_REP' 직무였던 사원의 
 * 이름, 성, 연봉, 부서명, 현재 직무명을 조회
 */
SELECT EMP.FIRST_NAME 
     , EMP.LAST_NAME 
     , EMP.SALARY 
     , DEP.DEPARTMENT_NAME 
     , JOB.JOB_TITLE 
  FROM EMPLOYEES EMP
 INNER JOIN JOB_HISTORY JH
    ON EMP.EMPLOYEE_ID = JH.EMPLOYEE_ID 
 INNER JOIN DEPARTMENTS DEP
    ON EMP.DEPARTMENT_ID = DEP.DEPARTMENT_ID 
 INNER JOIN JOBS JOB
    ON EMP.JOB_ID = JOB.JOB_ID 
 WHERE JH.JOB_ID = 'MK_REP'
;

/*
 * 'New Jersey' 주에서 근무중인 
 * 사원의 이름, 부서명, 연봉을 조회
 */
SELECT EMP.FIRST_NAME 
     , DEP.DEPARTMENT_NAME 
     , EMP.SALARY 
  FROM EMPLOYEES EMP
 INNER JOIN DEPARTMENTS DEP
    ON EMP.DEPARTMENT_ID = DEP.DEPARTMENT_ID 
 INNER JOIN LOCATIONS LOC
    ON DEP.LOCATION_ID = LOC.LOCATION_ID 
 WHERE LOC.STATE_PROVINCE = 'New Jersey'
;

/*
 * 'C'로 시작하는 도시에서 근무중인 
 * 사원의 이름, 부서명, 직무명, 도시명을 조회
 */
SELECT EMP.FIRST_NAME 
     , DEP.DEPARTMENT_NAME 
     , JOB.JOB_TITLE
     , LOC.CITY 
  FROM EMPLOYEES EMP
 INNER JOIN DEPARTMENTS DEP
    ON EMP.DEPARTMENT_ID = DEP.DEPARTMENT_ID 
 INNER JOIN LOCATIONS LOC
    ON DEP.LOCATION_ID = LOC.LOCATION_ID 
 INNER JOIN JOBS JOB
    ON EMP.JOB_ID = JOB.JOB_ID 
 WHERE LOC.CITY LIKE 'C%'
;

/*
 * 우편번호에 '7' 이 포함된 도시에서 근무중인 
 * 사원들의 사원번호, 직무명을 조회
 */
SELECT EMP.EMPLOYEE_ID 
     , JOB.JOB_TITLE 
  FROM EMPLOYEES EMP
 INNER JOIN DEPARTMENTS DEP
    ON EMP.DEPARTMENT_ID = DEP.DEPARTMENT_ID 
 INNER JOIN LOCATIONS LOC
    ON DEP.LOCATION_ID = LOC.LOCATION_ID 
 INNER JOIN JOBS JOB
    ON EMP.JOB_ID = JOB.JOB_ID 
 WHERE LOC.POSTAL_CODE LIKE '%7%'
;

/*
 * 회사 전체 평균연봉보다 많은 연봉을 받는 사원들의 
 * 이름과 부서명을 조회
 */
-- 평균연봉 = 6461.831
SELECT AVG(SALARY)
  FROM EMPLOYEES
;

SELECT *
  FROM EMPLOYEES EMP
 INNER JOIN DEPARTMENTS DEP
    ON EMP.DEPARTMENT_ID = DEP.DEPARTMENT_ID 
 WHERE EMP.SALARY > (SELECT AVG(SALARY)
                       FROM EMPLOYEES)
;


/*
 * Asia에 근무중인 사원들의
 * 사원번호, 이름, 성, 부서명, 직무명, 도시명을 조회
 */
SELECT EMP.EMPLOYEE_ID 
     , EMP.FIRST_NAME 
     , EMP.LAST_NAME 
     , DEP.DEPARTMENT_NAME 
     , JOB.JOB_TITLE 
     , LOC.CITY 
  FROM EMPLOYEES EMP
 INNER JOIN DEPARTMENTS DEP
    ON EMP.DEPARTMENT_ID = DEP.DEPARTMENT_ID 
 INNER JOIN LOCATIONS LOC
    ON DEP.LOCATION_ID = LOC.LOCATION_ID 
 INNER JOIN COUNTRIES COU
    ON LOC.COUNTRY_ID = COU.COUNTRY_ID 
 INNER JOIN REGIONS REG
    ON COU.REGION_ID = REG.REGION_ID 
 INNER JOIN JOBS JOB
    ON EMP.JOB_ID = JOB.JOB_ID 
 WHERE REG.REGION_NAME = 'Asia'
;
