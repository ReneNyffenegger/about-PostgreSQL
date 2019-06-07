drop  table if exists tq84_data;
create table tq84_data (
   region  varchar(5  ) not null,
   item    varchar(3  ) not null,
   val     decimal(5,2) not null
);

insert into tq84_data values ('west' , 'foo',  10.14);
insert into tq84_data values ('west' , 'foo', 423.18);
insert into tq84_data values ('west' , 'bar',  98.49);
insert into tq84_data values ('west' , 'bar',  17.38);
insert into tq84_data values ('west' , 'bar', 204.65);
insert into tq84_data values ('west' , 'baz', 131.87);

insert into tq84_data values ('east' , 'foo',  57.24);
insert into tq84_data values ('east' , 'bar', 423.18);
insert into tq84_data values ('east' , 'bar',  75.49);
insert into tq84_data values ('east' , 'baz',  36.88);
insert into tq84_data values ('east' , 'baz',   6.64);
insert into tq84_data values ('east' , 'baz', 342.54);

insert into tq84_data values ('north', 'baz',  83.85);
insert into tq84_data values ('north', 'bar',  22.88);

select
   region,
   sum(val) filter (where item = 'foo') foo,
   sum(val) filter (where item = 'bar') bar,
   sum(val) filter (where item = 'baz') baz
from
   tq84_data
group by
   region;

-- region   foo     bar     baz
-- -------------------------------
-- west     433.32  320.52  131.87
-- north     22.88   83.85
-- east      57.24  498.67  386.06
