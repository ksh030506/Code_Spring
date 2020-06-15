-- order by로 검색할 경우 데이터가 많으면 오래 걸린다 그래서 Index사용
-- order by는 soft를 하고 index는 soft를 안한다
select * from tbl_board ORDER by bno DESC;

-- 제귀 insert로 데이터량 늘리기
insert into tbl_board (bno, title, content, writer) 
(select seq_board.nextval, title, content, writer from tbl_board);

select * from tbl_board ORDER by bno DESC;

-- 인덱스로 정렬하기 문법 사용 ( /*+  */ )
select
    /*+ INDEX_DESC(tbl_board pk_board) */
    *
    from
        tbl_board
    where bno > 0;
    
-- 
select * from tbl_board ORDER by bno desc;

-- tbl_board를 pk_board로 정렬하기
select /*+INDEX_DESC (tbl_board pk_board) */*
from tbl_board;

-- FULL 옵션
select /*+ FULL(tbl_board) */ * from tbl_board order by bno desc;

-- 내림차순, 오름차순
select /*+ INDEX_ASC(tbl_board) */ * from tbl_board where bno > 0;
select /*+ INDEX_DESC(tbl_board) */ * from tbl_board where bno > 0;

-- rownum 부여하기
select ROWNUM rn, bno, title from tbl_board;
-- rownum 부여하고 order by로 정렬하기
select /*+ FULL(tbl_bard) */ ROWNUM rn, bno, title from tbl_board where bno > 0 ORDER by bno;

-- index를 이용하여 rownum을 사용하여 정렬하기
select /*+ INDEX_ASC(tbl_board pk_board) */
    ROWNUM rn, bno, title, content
    from tbl_board;
    
-- 10페이지씩 페지징 처리
select /*+ INDEX_DESC(tbl_board pk_board) */
ROWNUM rn, bno, title, content from tbl_board where bno > 0;

-- 
select /*+ INDEX_DESC(tbl_board pk_board) */
ROWNUM rn, bno, title, content from tbl_board where ROWNUM <= 10;



-- 인라인뷰를 사용하여 2페이지의 데이터 처리하기
select
    rn, bno, title, content
    from
        (
        select /*+ INDEX_DESC(tbl_board pk_board) */
            ROWNUM rn, bno, title, content
            from
                tbl_board
            where ROWNUM <= 20
        )
    where rn > 10;