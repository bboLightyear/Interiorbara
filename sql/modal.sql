create table modal_check(
m_type varchar2(40),
m_pname varchar(70),
m_pexp varchar(100),
m_pprice number
);
--���Ĵٵ�Ŀ�������׸���
insert into modal_check values('standard','ö��-����ٴ�(���)','�Ž� �� ��ٴ� ����ö��',3);
insert into modal_check values('standard','Ȯ��-���ڴ�(���Ҵ�)','�ܿ�/������ ���԰�',110);
insert into modal_check values('standard','����-�輱����(���)','��Ż ���𵨸� ����� �ʼ� ����',4);
insert into modal_check values('standard','����ġ/�ܼ�Ʈ��ü(����)','���׶���ǰ ����(�ΰǺ�����)',2);
insert into modal_check values('standard','����-��ü','���ô� ���� �� ���� ��� �ȳ�',null);
insert into modal_check values('standard','������','���� ��� �ȳ�',null);
insert into modal_check values('standard','�湮��ü(����)','�⺻ �÷���(������/��ø ����)',25);
insert into modal_check values('standard','�湮+��Ʋ��ü(����)','�÷�����,�귣��(������/��ø ����)',40);
insert into modal_check values('standard','�߹�','�⺻�� �̿� �߰���� �߻�',100);
insert into modal_check values('standard','����-����(��簡)','LX���� ����,�ΰǺ� ����',4);
insert into modal_check values('standard','����-��ũ(��簡)','LX���� ����,�ΰǺ� ����',8);
insert into modal_check values('standard','�ٴ�-����(��簡)','���Ĵٵ� ������(�������� ����)',11);
insert into modal_check values('standard','�ٴ�-����(��簡)','LX����(3T)����',5);
insert into modal_check values('standard','���-���Ĵٵ�(���Ҵ�)','�⼺����ǰ(����/�����̵���/�����ǰ/Ÿ�ϰ��� ����)',380);
insert into modal_check values('standard','�ʸ�-�湮(����)','���� ��ü�� ���� ����',12);
insert into modal_check values('standard','�ʸ�-����������',null,20);
insert into modal_check values('standard','�ֹ氡��-���Ĵٵ�(���ʹ�)','��/�Ϻ���,�⺻��ũ��/����,�ĵ� ����(�ֹ� �� Ÿ�� ������)',95);
insert into modal_check values('standard','���Ϸ���(���ʹ�)','�⺻ �����븮�� ���� ����',75);
insert into modal_check values('standard','�Ź���/������(���ʹ�)','�Ź��� �Ϻ� ���� �߰� ��� �߻�',45);
insert into modal_check values('standard','�ٹ�����(���ʹ�)','�⺻E0 PET��',35);
insert into modal_check values('standard','ź����Ʈ(���Ҵ�)','���ڴ� ����/������ ���� ����Ʈ',35);
insert into modal_check values('standard','Ÿ�ϰ���-���ڴ�(���Ҵ�)','�⺻ ����Ÿ��',50);
insert into modal_check values('standard','Ÿ�ϰ���-�����ٴ�','�⺻ ����Ÿ��(�ΰǺ� ����)',45);
insert into modal_check values('standard','����û��(��簡)','�⺻ ���� û��',1);


--�����̾�Ŀ�������׸���
insert into modal_check values('premium','ö��-������ü(���)','Ÿ��,�ٹ�����,�ֹ氡��,����,����(������ ö�� ������)',7);
insert into modal_check values('premium','ö��-����ٴ�(���)','�Ž� �� ��ٴ� ����ö��',3);
insert into modal_check values('premium','Ȯ��-���ڴ�(���Ҵ�)','�ܿ�/������ ���԰�',110);
insert into modal_check values('premium','����-�輱����(���)','��Ż ���𵨸� ����� �ʼ� ����',4);
insert into modal_check values('premium','����ġ/�ܼ�Ʈ��ü(����)','���׶���ǰ ����(�ΰǺ�����)',2);
insert into modal_check values('premium','����-��ü','���ô� ���� �� ���� ��� �ȳ�',null);
insert into modal_check values('premium','����-õ����Ե� �ð�(���)','LED 2/3��ġ ����(�ΰǺ� ����)',3);
insert into modal_check values('premium','������','���� ��� �ȳ�',null);
insert into modal_check values('premium','�湮��ü(����)','�귣��(������/��ø ����)',28);
insert into modal_check values('premium','�湮+��Ʋ��ü(����)','�÷�����,�귣��(������/��ø ����)',40);
insert into modal_check values('premium','�湮��ü(���絵��/����)','�귣��(������/��ø ����)',55);
insert into modal_check values('premium','�߹�-�����̾�','�귣�� �߹�',130);
insert into modal_check values('premium','����-��ũ(��簡)','LX���� ����,�ΰǺ� ����',8);
insert into modal_check values('premium','�ٴ�-����(��簡)','�����̾� ������(�������� ����)',13);
insert into modal_check values('premium','���-�����̾�(���Ҵ�)','�귣����ǰ(����/�����̵���/�����ǰ/Ÿ�ϰ��� ����)',480);
insert into modal_check values('premium','�ʸ�-�湮(����)','���� ��ü�� ���� ����',12);
insert into modal_check values('premium','�ʸ�-����������',null,20);
insert into modal_check values('premium','�ֹ氡��-���Ĵٵ�(���ʹ�)','��/�Ϻ���,�⺻��ũ��/����,�ĵ� ����(�ֹ� �� Ÿ�� ������)',95);
insert into modal_check values('premium','�ֹ氡��-�����̾�(���ʹ�)','��/�Ϻ���,�귣���ũ��/����,�ĵ� ����(�ֹ� �� Ÿ�� ������)',125);
insert into modal_check values('premium','���Ϸ���(���ʹ�)','�⺻ �����븮�� ���� ����',75);
insert into modal_check values('premium','�Ź���/������(���ʹ�)','�Ź��� �Ϻ� ���� �߰� ��� �߻�',45);
insert into modal_check values('premium','�ٹ�����(���ʹ�)','��������Ʈ PET��',65);
insert into modal_check values('premium','ź����Ʈ(���Ҵ�)','���ڴ� ����/������ ���� ����Ʈ',35);
insert into modal_check values('premium','Ÿ�ϰ���-���ڴ�(���Ҵ�)','�⺻ ����Ÿ��',50);
insert into modal_check values('premium','Ÿ�ϰ���-�����ٴ�','�⺻ ����Ÿ��(�ΰǺ� ����)',45);
insert into modal_check values('premium','����û��(��簡)','�⺻ ���� û��',1);

--�ֹ����׸���
insert into modal_check values('kitchen','�����(���ʹ�)','EO(PET)��������Ʈ(����600),����ø,Ǫ�õ���',50);
insert into modal_check values('kitchen','�Ϻ���(���ʹ�)','EO(PET)��������Ʈ(����850),����ø,Ǫ�õ���',60);
insert into modal_check values('kitchen','�������(���ʹ�)','EO(PET)����',50);
insert into modal_check values('kitchen','���Ϸ���(���ʹ�)','EO(PET)����(����850)',65);
insert into modal_check values('kitchen','�����븮�� ����(���ʹ�)','��/�Ϻ��� ���� �Է�, LX ���̸���(12T/��90cm����)',35);
insert into modal_check values('kitchen','�븮�� ����(���ʹ�)','��/�Ϻ��� ���� �Է�(12T/��90cm����)',55);
insert into modal_check values('kitchen','��ũ����-�⺻','���� ���� FC-US 100',9);
insert into modal_check values('kitchen','��ũ����-�����̾�','��Ƽ�� ����',25);
insert into modal_check values('kitchen','��ũ��','������ũ�� 780',38);
insert into modal_check values('kitchen','��Ÿ�� ����(���ʹ�)','����Ÿ��(300/600�� ����/�ΰǺ�����)',25);
insert into modal_check values('kitchen','�ĵ�','���̵� ��Ʈ�� �ĵ�(�����ġ ����)',30);

--������׸���
insert into modal_check values('bath','���-��üö��','Ÿ������ ��ü ö��',75);
insert into modal_check values('bath','���-�Ϻ�ö��','����/����/����/õ�� ö��',55);
insert into modal_check values('bath','��ǹ��','�������/��üö�� ���ý� �ʼ�üũ',30);
insert into modal_check values('bath','���Ÿ��-����','Ÿ�ϼ��� �� �ð�(���ũ�� 1500*2300����)',80);
insert into modal_check values('bath','���Ÿ��-��ü�ð�','Ÿ�ϼ��� �� �ð�(���ũ�� 1500*2300����)',110);
insert into modal_check values('bath','�纯��','�Ƹ޸�ĭ���Ĵٵ� ���ǽ�(Ÿ ��ǰ ���� ����)',55);
insert into modal_check values('bath','�纯�����ü��','�Ƹ޸�ĭ���Ĵٵ� �÷�(Ÿ ��ǰ ���� ����)',110);
insert into modal_check values('bath','����� ����','�Ƹ޸�ĭ���Ĵٵ� ����(Ÿ ��ǰ ���� ����)',15);
insert into modal_check values('bath','������ ����','�Ƹ޸�ĭ���Ĵٵ� ����(Ÿ ��ǰ ���� ����)',25);
insert into modal_check values('bath','�����','�Ƹ޸�ĭ���Ĵٵ� ����(Ÿ ��ǰ ���� ����)',25);
insert into modal_check values('bath','��ǾǼ��縮','5ǰ��Ʈ(�񴩴�/�ʰ���/��,�Ŵ�/��������/���ǰ���)',20);
insert into modal_check values('bath','����','�⺻ �÷� ����(1500*700)',35);
insert into modal_check values('bath','�����ν�','�Ϲ� ���� �����ν�',50);
insert into modal_check values('bath','�ſｽ���̵���','���� ���� ��(500*1000 ����)',30);
insert into modal_check values('bath','���õ��','������/SMCŸ��(���ũ�� 1500*2300����)',40);

select * from modal_check;
delete from modal_check;
commit;
---------------------------------------------------------

create table modal_complete(
m_no number,
m_addr varchar(100),
m_tel varchar(60),
m_content varchar(300),
m_size varchar(20),
m_request varchar(200),
m_price number,
m_date date,
m_wanttime varchar(30),
m_wantdate varchar(50),
m_circs varchar(20),
m_place varchar(30)
);
CREATE SEQUENCE m_no_seq
START WITH 20000
INCREMENT BY 1;

select * from modal_complete;
delete from modal_complete;
drop sequence m_no_seq;

insert into modal_complete values(m_no_seq.nextval,'�ּ�','��ȭ��ȣ','��������','���','�߰���û����',500,sysdate,'13�� 30��','yyyy-mm-dd','����(5�� �̸�)','����Ʈ');

commit;

