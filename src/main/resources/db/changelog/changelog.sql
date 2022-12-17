-- liquibase formatted sql

-- changeset deepak.n:20220417231009-1
-- preconditions onFail:MARK_RAN onError:MARK_RAN
create EXTENSION IF NOT EXISTS pgcrypto;
-- rollback drop extension pgcrypto;

-- changeset prashant.k:20220417231009-2
-- preconditions onFail:MARK_RAN onError:MARK_RAN
create SCHEMA IF NOT EXISTS todoApp;

-- changeset deepak.n:20220417231009-3
-- preconditions onFail:MARK_RAN onError:MARK_RAN
-- precondition-sql-check expectedResult:0 select count(*) from information_schema.tables where table_name = 'todoApp.post';
create TABLE IF NOT EXISTS todoApp.post (uuid UUID PRIMARY KEY DEFAULT gen_random_uuid(),
        content TEXT);
-- rollback drop table todoApp.post cascade;