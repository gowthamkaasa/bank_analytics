Create Database Bank_loanAnalytics;
USE Bank_loanAnalytics;
select * from finance__1;
select * FROM finance_2;
select count(*) FROM finance__1;
select count(*) FROM finance_2;

# KPI 1 YEAR WISE LOAN AMNT STATUS

select year(issue_d) "Year", sum(loan_amnt) "total amount" from finance__1 group by year(issue_d) order by year(issue_d);

# KPI 2 Grade and sub grade wise revol_bal

Select f1.grade, f1.sub_grade, sum(f2.revol_bal) as revolving_bal
from finance__1 as f1 inner join finance_2 as f2
on f1.id = f2.id
group by f1.grade, f1.sub_grade;

#KPI 3 Total Payment for Verified Status Vs Total Payment for Non Verified Status
select f1.verification_status, sum(f2.total_pymnt) as total_payment
from finance__1 as f1 inner join finance_2 as f2
on f1.id = f2.id
group by f1.verification_status;

# KPI 4 State wise and month wise loan status


select addr_state, loan_status, count(loan_status)
from finance__1
group by addr_state, loan_status
limit 10;

select monthname(f2.last_pymnt_d) pay_month, count(f1.loan_status) as loan_status
from finance__1 as f1 join finance_2 as f2
on f1.id = f2.id
group by pay_month;

# KPI 5 Home ownership Vs last payment date stats


select (f2.last_pymnt_d) payment_date, f1.home_ownership, count(f1.home_ownership) home_ownership
from finance__1 as f1 inner join finance_2 as f2
on f1.id = f2.id
group by (f2.last_pymnt_d), (f2.last_pymnt_d), f1.home_ownership
order by payment_date;
