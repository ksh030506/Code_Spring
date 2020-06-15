-- 게시물 마다 고유의 번호 => 시퀀스 생성
CREATE SEQUENCE seq_board;

-- 테이블 생성 (제목, 내용, 작성자, 생성 시간, 최종 수정 시간)
-- sysdate => 자동으로 시간을 구해줌
CREATE TABLE tb1_board (
    bno NUMBER(10,0),
    title VARCHAR2(200) not null,
    content VARCHAR2(2000) not null,
    writer VARCHAR2(50) not null,
    regdate DATE DEFAULT sysdate,
    updatedate DATE DEFAULT sysdate
);

-- 테이블에 기본키 부여 pk_board라는 이름 무여
ALTER TABLE tb1_board add CONSTRAINT pk_board
PRIMARY KEY (bno);

commit;

-- 더미 데이터 생성 (예시 데이터 생성)
INSERT INTO tbl_board (bno, title, content, writer) VALUES (seq_board.nextval, '테스트 제목1', '테스트 내용1', 'user00');
INSERT INTO tbl_board (bno, title, content, writer) VALUES (seq_board.nextval, '테스트 제목2', '테스트 내용2', 'user00');
INSERT INTO tbl_board (bno, title, content, writer) VALUES (seq_board.nextval, '테스트 제목3', '테스트 내용3', 'user00');
INSERT INTO tbl_board (bno, title, content, writer) VALUES (seq_board.nextval, '테스트 제목4', '테스트 내용4', 'user00');
INSERT INTO tbl_board (bno, title, content, writer) VALUES (seq_board.nextval, '테스트 제목5', '테스트 내용5', 'user00');

-- 커밋 
commit;

-- 테이블 검색하기
select * from tb1_board;

commit;