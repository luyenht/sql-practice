--- version 1---

with PREDAY as
(
select Workflow, 
      ExecutionDate,
      lag(ExecutionDate) over(
      partition by Workflow 
      order by ExecutionDate) as previousday
from WorkflowRuns
)


Select *,
     datediff(day,previousday, ExecutionDate) as SoNgayWorkflow,
      avg(datediff(day,previousday, ExecutionDate)) over(
      partition by Workflow
       ) as AVG_DAY

from PREDAY
where previousday is not null