# HSA L8.1: Transactions, Isolations, Locks

## Overview
This is an example project to show how changing isolation levels and making parallel queries
reproduce the main concurrency issues: lost updates, dirty reads, non-repeatable reads, and phantom reads.

## Getting Started

### Preparation
1. Run the docker containers.
```bash
  docker-compose up -d
```

Be sure to use ```docker-compose down -v``` to clean up after you're done with tests.

2. MySQL Clients:
Percona: ```docker exec -it percona mysql -u dev -p hsa```
Postgres: ```docker exec -it postgres psql -U dev -W hsa```

## Test cases

### 1. Percona: Isolation Levels vs Read/Update Phenomena

|  Isolation Levels  | Lost Updates |  Dirty Reads | Non-repeatable Reads | Phantom Reads |
| ------------------ | ------------ | -------------| -------------------- | ------------- |
| `Read Uncommitted` | may occur    | may occur    | may occur            | may occur     |
| `Read Committed`   | may occur    | don't occur  | may occur            | may occur     |
| `Repeatable Read`  | may occur    | don't occur  | don't occur          | may occur     |
| `Serializable`     | don't occur  | don't occur  | don't occur          | don't occur   |

#### 1.1.1 Read Uncommitted: Lost Updates
![Read Uncommitted: Lost Updates](resources/Percona_ReadUncommitted_LostUpdate.png)
#### 1.1.2 Read Uncommitted: Dirty Reads
![Read Uncommitted: Dirty Reads](resources/Percona_ReadUncommitted_DirtyRead.png)
#### 1.1.3 Read Uncommitted: Non-repeatable Reads
![Read Uncommitted: Non-repeatable Reads](resources/Percona_ReadUncommitted_NonRepeatableRead.png)
#### 1.1.4 Read Uncommitted: Phantom Reads
![Read Uncommitted: Phantom Reads](resources/Percona_ReadUncommitted_PhantomRead.png)

#### 1.2.1 Read Committed: Lost Updates
![Read Committed: Lost Updates](resources/Percona_ReadCommitted_LostUpdate.png)
#### 1.2.2 Read Committed: Dirty Reads
![Read Committed: Dirty Reads](resources/Percona_ReadCommitted_DirtyRead.png)
#### 1.2.3 Read Committed: Non-repeatable Reads
![Read Committed: Non-repeatable Reads](resources/Percona_ReadCommitted_NonRepeatableRead.png)
#### 1.2.4 Read Committed: Phantom Reads
![Read Committed: Phantom Reads](resources/Percona_ReadCommitted_PhantomRead.png)

#### 1.3.1 Repeatable Read: Lost Updates
![Repeatable Read: Lost Updates](resources/Percona_RepeatableRead_LostUpdate.png)
#### 1.3.2 Repeatable Read: Dirty Reads
![Repeatable Read: Dirty Reads](resources/Percona_RepeatableRead_DirtyRead.png)
#### 1.3.3 Repeatable Read: Non-repeatable Reads
![Repeatable Read: Non-repeatable Reads](resources/Percona_RepeatableRead_NonRepeatableRead.png)
#### 1.3.4 Repeatable Read: Phantom Reads
![Repeatable Read: Phantom Reads](resources/Percona_RepeatableRead_PhantomRead.png)

#### 1.4.1 Serializable: Lost Updates
![Serializable: Lost Updates](resources/Percona_Serializable_LostUpdate.png)
#### 1.4.2 Serializable: Dirty Reads
![Serializable: Dirty Reads](resources/Percona_Serializable_DirtyRead.png)
#### 1.4.3 Serializable: Non-repeatable Reads
![Serializable: Non-repeatable Reads](resources/Percona_Serializable_NonRepeatableRead.png)
#### 1.4.4 Serializable: Phantom Reads
![Serializable: Phantom Reads](resources/Percona_Serializable_PhantomRead.png)

### 2. PostgreSQL: Isolation Levels vs Read/Update Phenomena

|  Isolation Levels  | Lost Updates |  Dirty Reads | Non-repeatable Reads | Phantom Reads |
| ------------------ | ------------ | -------------| -------------------- | ------------- |
| `Read Uncommitted` | may occur    | don't occur  | may occur            | may occur     |
| `Read Committed`   | may occur    | don't occur  | may occur            | may occur     |
| `Repeatable Read`  | don't occur  | don't occur  | don't occur          | don't occur   |
| `Serializable`     | don't occur  | don't occur  | don't occur          | don't occur   |

#### 2.1.1 Read Uncommitted: Lost Updates
![Read Uncommitted: Lost Updates](resources/Postgres_ReadUncommitted_LostUpdate.png)
#### 2.1.2 Read Uncommitted: Dirty Reads
![Read Uncommitted: Dirty Reads](resources/Postgres_ReadUncommitted_DirtyRead.png)
#### 2.1.3 Read Uncommitted: Non-repeatable Reads
![Read Uncommitted: Non-repeatable Reads](resources/Postgres_ReadUncommitted_NonRepeatableRead.png)
#### 2.1.4 Read Uncommitted: Phantom Reads
![Read Uncommitted: Phantom Reads](resources/Postgres_ReadUncommitted_PhantomRead.png)

#### 2.2.1 Read Committed: Lost Updates
![Read Committed: Lost Updates](resources/Postgres_ReadCommitted_LostUpdate.png)
#### 2.2.2 Read Committed: Dirty Reads
![Read Committed: Dirty Reads](resources/Postgres_ReadCommitted_DirtyRead.png)
#### 2.2.3 Read Committed: Non-repeatable Reads
![Read Committed: Non-repeatable Reads](resources/Postgres_ReadCommitted_NonRepeatableRead.png)
#### 2.2.4 Read Committed: Phantom Reads
![Read Committed: Phantom Reads](resources/Postgres_ReadCommitted_PhantomRead.png)

#### 2.3.1 Repeatable Read: Lost Updates
![Repeatable Read: Lost Updates](resources/Postgres_RepeatableRead_LostUpdate.png)
#### 2.3.2 Repeatable Read: Dirty Reads
![Repeatable Read: Dirty Reads](resources/Postgres_RepeatableRead_DirtyRead.png)
#### 2.3.3 Repeatable Read: Non-repeatable Reads
![Repeatable Read: Non-repeatable Reads](resources/Postgres_RepeatableRead_NonRepeatableRead.png)
#### 2.3.4 Repeatable Read: Phantom Reads
![Repeatable Read: Phantom Reads](resources/Postgres_RepeatableRead_PhantomRead.png)

#### 2.4.1 Serializable: Lost Updates
![Serializable: Lost Updates](resources/Postgres_Serializable_LostUpdate.png)
#### 2.4.2 Serializable: Dirty Reads
![Serializable: Dirty Reads](resources/Postgres_Serializable_DirtyRead.png)
#### 2.4.3 Serializable: Non-repeatable Reads
![Serializable: Non-repeatable Reads](resources/Postgres_Serializable_NonRepeatableRead.png)
#### 2.4.4 Serializable: Phantom Reads
![Serializable: Phantom Reads](resources/Postgres_Serializable_PhantomRead.png)