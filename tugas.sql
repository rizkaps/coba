create database kampus;
use kampus;

create table mahasiswa(
nim int(11) primary key auto_increment,
nama varchar(50),
jenis_kelamin enum ('L','P'),
alamat varchar(100)
);

create table matakuliah(
kode_mk varchar(40) primary key,
nama_mk varchar(70),
sks int(10),
semester int(10) 
);

create table ambil_mk(
nim int(10),
kode_mk varchar(20),
primary key(nim, kode_mk),
foreign key(nim) references mahasiswa(nim)
on delete cascade
on update cascade,
foreign key(kode_mk) references matakuliah(kode_mk)
on delete cascade
on update cascade
);

insert into mahasiswa values
(101,'Arif','L','Jl.Kenangan'),
(102,'Budi','L','Jl.Jombang'),
(103,'Wati','P','Jl.Surabaya'),
(104,'Ika','P','Jl.Jombang'),
(105,'Tono','L','Jl.Jakarta'),
(106,'Iwan','L','Jl.Bandung'),
(107,'Sari','P','Jl.Malang');

insert into matakuliah values
('PTI447','Praktikum Basis Data',1,3),
('TIK342','Praktikum Basis Data',1,3),
('PTI333','Basis Data Terdistribusi',3,5),
('TIK123','Jaringan Komputer',2,5),
('TIK333','Sistem Operasi',3,5),
('PTI123','Grafika Multimedia',3,5),
('PTI777','Sistem Informasi',1,3);

insert into ambil_mk values
(101,'PTI447'),
(103,'PTI333'),
(104,'TIK333'),
(104,'PTI777');

select * from mahasiswa;
select * from matakuliah;
select * from ambil_mk;
--  nomor 1
select distinct n.nim, m.nama from ambil_mk n natural join mahasiswa m;
--  nomor 3
select m.nim, m.nama, k.kode_mk, k.nama_mk 
from mahasiswa m
inner join ambil_mk a
on m.nim = a.nim
inner join matakuliah k
on a.kode_mk = k.kode_mk;
