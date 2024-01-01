--xxgtm_TextileMachinery_mto
CREATE TABLE xxgtm_TextileMachinery_mto (
    machine_id INT PRIMARY KEY,
    machine_type VARCHAR(50),
    manufacturer VARCHAR(100),
    installation_date DATE,
    maintenance_schedule VARCHAR(50),
    machine_status VARCHAR(50),
    CREATED_BY     NUMBER,
    CREATION_DATE  DATE,
    LAST_UPDATED_BY NUMBER,
    LAST_UPDATE_DATE DATE

);


--customer
create table XX_GTM_CUSTOMER_MTO
(
  cnic          NUMBER primary key not null,
  customer_name VARCHAR2(100) not null,
  account_type  VARCHAR2(20),
  email         VARCHAR2(100),
  phone_number  VARCHAR2(20) not null,
  city          VARCHAR2(50) not null,
  area          VARCHAR2(50) not null,
  country       VARCHAR2(50) not null
);


--ORDER
create table XX_GTM_ORDER_MTO
(
  order_id     NUMBER primary key not null,
  product_id   NUMBER,
  order_date   DATE not null,
  total_amount NUMBER not null,
  order_status VARCHAR2(50) not null,
  cnic         NUMBER
);
alter table XX_GTM_ORDER_MTO
  add constraint FK_CNIC foreign key (CNIC)
  references XX_GTM_CUSTOMER_MTO (CNIC);
alter table XX_GTM_ORDER_MTO
  add foreign key (PRODUCT_ID)
  references XX_GTM_PRODUCT_MTO (PRODUCT_ID);

--shipping
create table XX_GTM_SHIPPING_MTO
(
  shipping_id            NUMBER primary key not null,
  order_id               NUMBER,
  shipping_date          DATE,
  carrier_name           VARCHAR2(100),
  tracking_number        VARCHAR2(50),
  estimated_arrival_date DATE,
  shipping_status        VARCHAR2(50)
);
alter table XX_GTM_SHIPPING_MTO
  add foreign key (ORDER_ID)
  references XX_GTM_ORDER_MTO (ORDER_ID);

--product
create table XX_GTM_PRODUCT_MTO
(
  product_id         NUMBER primary key not null,
  product_name       VARCHAR2(100) not null,
  category           VARCHAR2(30) not null,
  descriptions       VARCHAR2(255),
  price              NUMBER not null,
  quantity_available NUMBER not null
);
