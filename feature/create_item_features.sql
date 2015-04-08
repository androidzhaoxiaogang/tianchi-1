# 最后一天购买量
drop table if exists feature.train_item_l1_buy;
create table feature.train_item_l1_buy as
	select item_id,ifnull(l1_buy,0) as item_l1_buy from
    washed.item_subset as a
    left outer join
    (select item_id as item_id_b, count(behavior_type) as l1_buy from washed.tianchi_p_1_30
    where behavior_type=4 and event_date=30 group by item_id) as b
    on a.item_id=b.item_id_b;
    
drop table if exists feature.pre_item_l1_buy;
create table feature.pre_item_l1_buy as
	select item_id,ifnull(l1_buy,0) as item_l1_buy from
    washed.item_subset as a
    left outer join
    (select item_id as item_id_b, count(behavior_type) as l1_buy from washed.tianchi_p_2_31
    where behavior_type=4 and event_date=31 group by item_id) as b
    on a.item_id=b.item_id_b;
    
# 最后3天购买量
drop table if exists feature.train_item_l3_buy;
create table feature.train_item_l3_buy as
	select item_id,ifnull(l3_buy,0) as item_l3_buy from
    washed.item_subset as a
    left outer join
    (select item_id as item_id_b, (count(behavior_type)/3) as l3_buy from washed.tianchi_p_1_30
    where behavior_type=4 and event_date between 28 and 30 group by item_id) as b
    on a.item_id=b.item_id_b;
    
drop table if exists feature.pre_item_l3_buy;
create table feature.pre_item_l3_buy as
	select item_id,ifnull(l3_buy,0) as item_l3_buy from
    washed.item_subset as a
    left outer join
    (select item_id as item_id_b, (count(behavior_type)/3) as l3_buy from washed.tianchi_p_2_31
    where behavior_type=4 and event_date between 29 and 31 group by item_id) as b
    on a.item_id=b.item_id_b;
    
# 最后7天购买量
drop table if exists feature.train_item_l7_buy;
create table feature.train_item_l7_buy as
	select item_id,ifnull(l7_buy,0) as item_l7_buy from
    washed.item_subset as a
    left outer join
    (select item_id as item_id_b, (count(behavior_type)/7) as l7_buy from washed.tianchi_p_1_30
    where behavior_type=4 and event_date between 22 and 30 and event_date not in (24,25) group by item_id) as b
    on a.item_id=b.item_id_b;
    
drop table if exists feature.pre_item_l7_buy;
create table feature.pre_item_l7_buy as
	select item_id,ifnull(l7_buy,0) as item_l7_buy from
    washed.item_subset as a
    left outer join
    (select item_id as item_id_b, (count(behavior_type)/7) as l7_buy from washed.tianchi_p_2_31
    where behavior_type=4 and event_date between 23 and 31 and event_date not in (24,25) group by item_id) as b
    on a.item_id=b.item_id_b;
    
# 最后14天购买量
drop table if exists feature.train_item_l14_buy;
create table feature.train_item_l14_buy as
	select item_id,ifnull(l14_buy,0) as item_l14_buy from
    washed.item_subset as a
    left outer join
    (select item_id as item_id_b, (count(behavior_type)/14) as l14_buy from washed.tianchi_p_1_30
    where behavior_type=4 and event_date between 15 and 30 and event_date not in (24,25) group by item_id) as b
    on a.item_id=b.item_id_b;
    
drop table if exists feature.pre_item_l14_buy;
create table feature.pre_item_l14_buy as
	select item_id,ifnull(l14_buy,0) as item_l14_buy from
    washed.item_subset as a
    left outer join
    (select item_id as item_id_b, (count(behavior_type)/14) as l14_buy from washed.tianchi_p_2_31
    where behavior_type=4 and event_date between 16 and 31 and event_date not in (24,25) group by item_id) as b
    on a.item_id=b.item_id_b;
    
# 最后28天购买量
drop table if exists feature.train_item_l28_buy;
create table feature.train_item_l28_buy as
	select item_id,ifnull(l28_buy,0) as item_l28_buy from
    washed.item_subset as a
    left outer join
    (select item_id as item_id_b, (count(behavior_type)/28) as l28_buy from washed.tianchi_p_1_30
    where behavior_type=4 and event_date between 1 and 30 and event_date not in (24,25) group by item_id) as b
    on a.item_id=b.item_id_b;
    
drop table if exists feature.pre_item_l28_buy;
create table feature.pre_item_l28_buy as
	select item_id,ifnull(l28_buy,0) as item_l28_buy from
    washed.item_subset as a
    left outer join
    (select item_id as item_id_b, (count(behavior_type)/28) as l28_buy from washed.tianchi_p_2_31
    where behavior_type=4 and event_date between 2 and 31 and event_date not in (24,25) group by item_id) as b
    on a.item_id=b.item_id_b;
    
# ===============================================================================================

# 最后一天交互量
drop table if exists feature.train_item_l1_inter;
create table feature.train_item_l1_inter as
	select item_id,ifnull(l1_inter,0) as item_l1_inter from
    washed.item_subset as a
    left outer join
    (select item_id as item_id_b, count(event_date) as l1_inter from washed.tianchi_p_1_30
    where event_date=30 group by item_id) as b
    on a.item_id=b.item_id_b;
    
drop table if exists feature.pre_item_l1_inter;
create table feature.pre_item_l1_inter as
	select item_id,ifnull(l1_inter,0) as item_l1_inter from
    washed.item_subset as a
    left outer join
    (select item_id as item_id_b, count(event_date) as l1_inter from washed.tianchi_p_2_31
    where event_date=31 group by item_id) as b
    on a.item_id=b.item_id_b;
    
# 最后3天交互量
drop table if exists feature.train_item_l3_inter;
create table feature.train_item_l3_inter as
	select item_id,ifnull(l3_inter,0) as item_l3_inter from
    washed.item_subset as a
    left outer join
    (select item_id as item_id_b, (count(event_date)/3) as l3_inter from washed.tianchi_p_1_30
    where event_date between 28 and 30 group by item_id) as b
    on a.item_id=b.item_id_b;
    
drop table if exists feature.pre_item_l3_inter;
create table feature.pre_item_l3_inter as
	select item_id,ifnull(l3_inter,0) as item_l3_inter from
    washed.item_subset as a
    left outer join
    (select item_id as item_id_b, (count(event_date)/3) as l3_inter from washed.tianchi_p_2_31
    where event_date between 29 and 31 group by item_id) as b
    on a.item_id=b.item_id_b;
    
# 最后7天交互量
drop table if exists feature.train_item_l7_inter;
create table feature.train_item_l7_inter as
	select item_id,ifnull(l7_inter,0) as item_l7_inter from
    washed.item_subset as a
    left outer join
    (select item_id as item_id_b, (count(event_date)/7) as l7_inter from washed.tianchi_p_1_30
    where event_date between 22 and 30 and event_date not in (24,25) group by item_id) as b
    on a.item_id=b.item_id_b;
    
drop table if exists feature.pre_item_l7_inter;
create table feature.pre_item_l7_inter as
	select item_id,ifnull(l7_inter,0) as item_l7_inter from
    washed.item_subset as a
    left outer join
    (select item_id as item_id_b, (count(event_date)/7) as l7_inter from washed.tianchi_p_2_31
    where event_date between 23 and 31 and event_date not in (24,25) group by item_id) as b
    on a.item_id=b.item_id_b;
    
# 最后14天交互量
drop table if exists feature.train_item_l14_inter;
create table feature.train_item_l14_inter as
	select item_id,ifnull(l14_inter,0) as item_l14_inter from
    washed.item_subset as a
    left outer join
    (select item_id as item_id_b, (count(event_date)/14) as l14_inter from washed.tianchi_p_1_30
    where event_date between 15 and 30 and event_date not in (24,25) group by item_id) as b
    on a.item_id=b.item_id_b;
    
drop table if exists feature.pre_item_l14_inter;
create table feature.pre_item_l14_inter as
	select item_id,ifnull(l14_inter,0) as item_l14_inter from
    washed.item_subset as a
    left outer join
    (select item_id as item_id_b, (count(event_date)/14) as l14_inter from washed.tianchi_p_2_31
    where event_date between 16 and 31 and event_date not in (24,25) group by item_id) as b
    on a.item_id=b.item_id_b;
    
# 最后28天交互量
drop table if exists feature.train_item_l28_inter;
create table feature.train_item_l28_inter as
	select item_id,ifnull(l28_inter,0) as item_l28_inter from
    washed.item_subset as a
    left outer join
    (select item_id as item_id_b, (count(event_date)/28) as l28_inter from washed.tianchi_p_1_30
    where event_date between 1 and 30 and event_date not in (24,25) group by item_id) as b
    on a.item_id=b.item_id_b;
    
drop table if exists feature.pre_item_l28_inter;
create table feature.pre_item_l28_inter as
	select item_id,ifnull(l28_inter,0) as item_l28_inter from
    washed.item_subset as a
    left outer join
    (select item_id as item_id_b, (count(event_date)/28) as l28_inter from washed.tianchi_p_2_31
    where event_date between 2 and 31 and event_date not in (24,25) group by item_id) as b
    on a.item_id=b.item_id_b;
    
# ===============================================================================================
# 商品在最近1天被多少不同用户购买
drop table if exists feature.train_item_l1_buy_user;
create table feature.train_item_l1_buy_user as
	select item_id, ifnull(l1_buy_user,0) as item_l1_buy_user from
    washed.item_subset as a
    left outer join
    (select item_id as item_id_b, count(distinct(user_id)) as l1_buy_user from washed.tianchi_p_1_30
    where event_date=30 and behavior_type=4 group by item_id) as b
    on a.item_id=b.item_id_b;
    
drop table if exists feature.pre_item_l1_buy_user;
create table feature.pre_item_l1_buy_user as
	select item_id, ifnull(l1_buy_user,0) as item_l1_buy_user from
    washed.item_subset as a
    left outer join
    (select item_id as item_id_b, count(distinct(user_id)) as l1_buy_user from washed.tianchi_p_2_31
    where event_date=31 and behavior_type=4 group by item_id) as b
    on a.item_id=b.item_id_b;
    
# 商品在最近3天被多少不同用户购买
drop table if exists feature.train_item_l3_buy_user;
create table feature.train_item_l3_buy_user as
	select item_id, ifnull(l3_buy_user,0) as item_l3_buy_user from
    washed.item_subset as a
    left outer join
    (select item_id as item_id_b, count(distinct(user_id)) as l3_buy_user from washed.tianchi_p_1_30
    where event_date between 28 and 30 and behavior_type=4 group by item_id) as b
    on a.item_id=b.item_id_b;
    
drop table if exists feature.pre_item_l3_buy_user;
create table feature.pre_item_l3_buy_user as
	select item_id, ifnull(l3_buy_user,0) as item_l3_buy_user from
    washed.item_subset as a
    left outer join
    (select item_id as item_id_b, count(distinct(user_id)) as l3_buy_user from washed.tianchi_p_2_31
    where event_date between 29 and 31 and behavior_type=4 group by item_id) as b
    on a.item_id=b.item_id_b;
    
# 商品在最近7天被多少不同用户购买
drop table if exists feature.train_item_l7_buy_user;
create table feature.train_item_l7_buy_user as
	select item_id, ifnull(l7_buy_user,0) as item_l7_buy_user from
    washed.item_subset as a
    left outer join
    (select item_id as item_id_b, count(distinct(user_id)) as l7_buy_user from washed.tianchi_p_1_30
    where event_date between 22 and 30 and event_date not in (24,25) and behavior_type=4 group by item_id) as b
    on a.item_id=b.item_id_b;
    
drop table if exists feature.pre_item_l7_buy_user;
create table feature.pre_item_l7_buy_user as
	select item_id, ifnull(l7_buy_user,0) as item_l7_buy_user from
    washed.item_subset as a
    left outer join
    (select item_id as item_id_b, count(distinct(user_id)) as l7_buy_user from washed.tianchi_p_2_31
    where event_date between 23 and 31 and event_date not in (24,25) and behavior_type=4 group by item_id) as b
    on a.item_id=b.item_id_b;
    
# 商品在最近14天被多少不同用户购买
drop table if exists feature.train_item_l14_buy_user;
create table feature.train_item_l14_buy_user as
	select item_id, ifnull(l14_buy_user,0) as item_l14_buy_user from
    washed.item_subset as a
    left outer join
    (select item_id as item_id_b, count(distinct(user_id)) as l14_buy_user from washed.tianchi_p_1_30
    where event_date between 15 and 30 and event_date not in (24,25) and behavior_type=4 group by item_id) as b
    on a.item_id=b.item_id_b;
    
drop table if exists feature.pre_item_l14_buy_user;
create table feature.pre_item_l14_buy_user as
	select item_id, ifnull(l14_buy_user,0) as item_l14_buy_user from
    washed.item_subset as a
    left outer join
    (select item_id as item_id_b, count(distinct(user_id)) as l14_buy_user from washed.tianchi_p_2_31
    where event_date between 16 and 31 and event_date not in (24,25) and behavior_type=4 group by item_id) as b
    on a.item_id=b.item_id_b;
    
# 商品在最近28天被多少不同用户购买
drop table if exists feature.train_item_l28_buy_user;
create table feature.train_item_l28_buy_user as
	select item_id, ifnull(l28_buy_user,0) as item_l28_buy_user from
    washed.item_subset as a
    left outer join
    (select item_id as item_id_b, count(distinct(user_id)) as l28_buy_user from washed.tianchi_p_1_30
    where event_date between 1 and 30 and event_date not in (24,25) and behavior_type=4 group by item_id) as b
    on a.item_id=b.item_id_b;
    
drop table if exists feature.pre_item_l28_buy_user;
create table feature.pre_item_l28_buy_user as
	select item_id, ifnull(l28_buy_user,0) as item_l28_buy_user from
    washed.item_subset as a
    left outer join
    (select item_id as item_id_b, count(distinct(user_id)) as l28_buy_user from washed.tianchi_p_2_31
    where event_date between 2 and 31 and event_date not in (24,25) and behavior_type=4 group by item_id) as b
    on a.item_id=b.item_id_b;
    
# ===============================================================================================
# 商品在最近1天被多少不同用户点击
drop table if exists feature.train_item_l1_click_user;
create table feature.train_item_l1_click_user as
	select item_id, ifnull(l1_click_user,0) as item_l1_click_user from
    washed.item_subset as a
    left outer join
    (select item_id as item_id_b, count(distinct(user_id)) as l1_click_user from washed.tianchi_p_1_30
    where event_date=30 and behavior_type=1 group by item_id) as b
    on a.item_id=b.item_id_b;
    
drop table if exists feature.pre_item_l1_click_user;
create table feature.pre_item_l1_click_user as
	select item_id, ifnull(l1_click_user,0) as item_l1_click_user from
    washed.item_subset as a
    left outer join
    (select item_id as item_id_b, count(distinct(user_id)) as l1_click_user from washed.tianchi_p_2_31
    where event_date=31 and behavior_type=1 group by item_id) as b
    on a.item_id=b.item_id_b;
    
# 商品在最近3天被多少不同用户点击
drop table if exists feature.train_item_l3_click_user;
create table feature.train_item_l3_click_user as
	select item_id, ifnull(l3_click_user,0) as item_l3_click_user from
    washed.item_subset as a
    left outer join
    (select item_id as item_id_b, count(distinct(user_id)) as l3_click_user from washed.tianchi_p_1_30
    where event_date between 28 and 30 and behavior_type=1 group by item_id) as b
    on a.item_id=b.item_id_b;
    
drop table if exists feature.pre_item_l3_click_user;
create table feature.pre_item_l3_click_user as
	select item_id, ifnull(l3_click_user,0) as item_l3_click_user from
    washed.item_subset as a
    left outer join
    (select item_id as item_id_b, count(distinct(user_id)) as l3_click_user from washed.tianchi_p_2_31
    where event_date between 29 and 31 and behavior_type=1 group by item_id) as b
    on a.item_id=b.item_id_b;
    
# 商品在最近7天被多少不同用户点击
drop table if exists feature.train_item_l7_click_user;
create table feature.train_item_l7_click_user as
	select item_id, ifnull(l7_click_user,0) as item_l7_click_user from
    washed.item_subset as a
    left outer join
    (select item_id as item_id_b, count(distinct(user_id)) as l7_click_user from washed.tianchi_p_1_30
    where event_date between 22 and 30 and event_date not in (24,25) and behavior_type=1 group by item_id) as b
    on a.item_id=b.item_id_b;
    
drop table if exists feature.pre_item_l7_click_user;
create table feature.pre_item_l7_click_user as
	select item_id, ifnull(l7_click_user,0) as item_l7_click_user from
    washed.item_subset as a
    left outer join
    (select item_id as item_id_b, count(distinct(user_id)) as l7_click_user from washed.tianchi_p_2_31
    where event_date between 23 and 31 and event_date not in (24,25) and behavior_type=1 group by item_id) as b
    on a.item_id=b.item_id_b;
    
# 商品在最近14天被多少不同用户点击
drop table if exists feature.train_item_l14_click_user;
create table feature.train_item_l14_click_user as
	select item_id, ifnull(l14_click_user,0) as item_l14_click_user from
    washed.item_subset as a
    left outer join
    (select item_id as item_id_b, count(distinct(user_id)) as l14_click_user from washed.tianchi_p_1_30
    where event_date between 15 and 30 and event_date not in (24,25) and behavior_type=1 group by item_id) as b
    on a.item_id=b.item_id_b;
    
drop table if exists feature.pre_item_l14_click_user;
create table feature.pre_item_l14_click_user as
	select item_id, ifnull(l14_click_user,0) as item_l14_click_user from
    washed.item_subset as a
    left outer join
    (select item_id as item_id_b, count(distinct(user_id)) as l14_click_user from washed.tianchi_p_2_31
    where event_date between 16 and 31 and event_date not in (24,25) and behavior_type=1 group by item_id) as b
    on a.item_id=b.item_id_b;
    
# 商品在最近28天被多少不同用户点击
drop table if exists feature.train_item_l28_click_user;
create table feature.train_item_l28_click_user as
	select item_id, ifnull(l28_click_user,0) as item_l28_click_user from
    washed.item_subset as a
    left outer join
    (select item_id as item_id_b, count(distinct(user_id)) as l28_click_user from washed.tianchi_p_1_30
    where event_date between 1 and 30 and event_date not in (24,25) and behavior_type=1 group by item_id) as b
    on a.item_id=b.item_id_b;
    
drop table if exists feature.pre_item_l28_click_user;
create table feature.pre_item_l28_click_user as
	select item_id, ifnull(l28_click_user,0) as item_l28_click_user from
    washed.item_subset as a
    left outer join
    (select item_id as item_id_b, count(distinct(user_id)) as l28_click_user from washed.tianchi_p_2_31
    where event_date between 2 and 31 and event_date not in (24,25) and behavior_type=1 group by item_id) as b
    on a.item_id=b.item_id_b;
    
# ===============================================================================================
# 商品在最近1天被多少不同用户交互
drop table if exists feature.train_item_l1_inter_user;
create table feature.train_item_l1_inter_user as
	select item_id, ifnull(l1_inter_user,0) as item_l1_inter_user from
    washed.item_subset as a
    left outer join
    (select item_id as item_id_b, count(distinct(user_id)) as l1_inter_user from washed.tianchi_p_1_30
    where event_date=30 group by item_id) as b
    on a.item_id=b.item_id_b;
    
drop table if exists feature.pre_item_l1_inter_user;
create table feature.pre_item_l1_inter_user as
	select item_id, ifnull(l1_inter_user,0) as item_l1_inter_user from
    washed.item_subset as a
    left outer join
    (select item_id as item_id_b, count(distinct(user_id)) as l1_inter_user from washed.tianchi_p_2_31
    where event_date=31 group by item_id) as b
    on a.item_id=b.item_id_b;
    
# 商品在最近3天被多少不同用户交互
drop table if exists feature.train_item_l3_inter_user;
create table feature.train_item_l3_inter_user as
	select item_id, ifnull(l3_inter_user,0) as item_l3_inter_user from
    washed.item_subset as a
    left outer join
    (select item_id as item_id_b, count(distinct(user_id)) as l3_inter_user from washed.tianchi_p_1_30
    where event_date between 28 and 30 group by item_id) as b
    on a.item_id=b.item_id_b;
    
drop table if exists feature.pre_item_l3_inter_user;
create table feature.pre_item_l3_inter_user as
	select item_id, ifnull(l3_inter_user,0) as item_l3_inter_user from
    washed.item_subset as a
    left outer join
    (select item_id as item_id_b, count(distinct(user_id)) as l3_inter_user from washed.tianchi_p_2_31
    where event_date between 29 and 31 group by item_id) as b
    on a.item_id=b.item_id_b;
    
# 商品在最近7天被多少不同用户交互
drop table if exists feature.train_item_l7_inter_user;
create table feature.train_item_l7_inter_user as
	select item_id, ifnull(l7_inter_user,0) as item_l7_inter_user from
    washed.item_subset as a
    left outer join
    (select item_id as item_id_b, count(distinct(user_id)) as l7_inter_user from washed.tianchi_p_1_30
    where event_date between 22 and 30 and event_date not in (24,25) group by item_id) as b
    on a.item_id=b.item_id_b;
    
drop table if exists feature.pre_item_l7_inter_user;
create table feature.pre_item_l7_inter_user as
	select item_id, ifnull(l7_inter_user,0) as item_l7_inter_user from
    washed.item_subset as a
    left outer join
    (select item_id as item_id_b, count(distinct(user_id)) as l7_inter_user from washed.tianchi_p_2_31
    where event_date between 23 and 31 and event_date not in (24,25) group by item_id) as b
    on a.item_id=b.item_id_b;
    
# 商品在最近14天被多少不同用户交互
drop table if exists feature.train_item_l14_inter_user;
create table feature.train_item_l14_inter_user as
	select item_id, ifnull(l14_inter_user,0) as item_l14_inter_user from
    washed.item_subset as a
    left outer join
    (select item_id as item_id_b, count(distinct(user_id)) as l14_inter_user from washed.tianchi_p_1_30
    where event_date between 15 and 30 and event_date not in (24,25) group by item_id) as b
    on a.item_id=b.item_id_b;
    
drop table if exists feature.pre_item_l14_inter_user;
create table feature.pre_item_l14_inter_user as
	select item_id, ifnull(l14_inter_user,0) as item_l14_inter_user from
    washed.item_subset as a
    left outer join
    (select item_id as item_id_b, count(distinct(user_id)) as l14_inter_user from washed.tianchi_p_2_31
    where event_date between 16 and 31 and event_date not in (24,25) group by item_id) as b
    on a.item_id=b.item_id_b;
    
# 商品在最近28天被多少不同用户交互
drop table if exists feature.train_item_l28_inter_user;
create table feature.train_item_l28_inter_user as
	select item_id, ifnull(l28_inter_user,0) as item_l28_inter_user from
    washed.item_subset as a
    left outer join
    (select item_id as item_id_b, count(distinct(user_id)) as l28_inter_user from washed.tianchi_p_1_30
    where event_date between 1 and 30 and event_date not in (24,25) group by item_id) as b
    on a.item_id=b.item_id_b;
    
drop table if exists feature.pre_item_l28_inter_user;
create table feature.pre_item_l28_inter_user as
	select item_id, ifnull(l28_inter_user,0) as item_l28_inter_user from
    washed.item_subset as a
    left outer join
    (select item_id as item_id_b, count(distinct(user_id)) as l28_inter_user from washed.tianchi_p_2_31
    where event_date between 2 and 31 and event_date not in (24,25) group by item_id) as b
    on a.item_id=b.item_id_b;