with del as (
   delete from abc
   where
     id < 4
   returning *
)
insert into abc_hist
select
   del.id,
   del.val_important,
   localtimestamp
from
   del;
