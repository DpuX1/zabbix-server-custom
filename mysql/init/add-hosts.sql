-- Получаем ID группы "Linux servers"
SET @groupid = (SELECT groupid FROM groups WHERE name = 'Linux servers' LIMIT 1);

-- Хост 1: mysql-agent (IP 172.19.0.11, порт 10050)
INSERT INTO hosts (hostid, host, name, status)
VALUES (10001, 'mysql-agent', 'mysql-agent', 0)
ON DUPLICATE KEY UPDATE host=host;

INSERT INTO hosts_groups (hostid, groupid)
VALUES (10001, @groupid)
ON DUPLICATE KEY UPDATE hostid=hostid;

INSERT INTO interface (interfaceid, hostid, main, type, useip, ip, dns, port)
VALUES (10001, 10001, 1, 1, 1, '172.19.0.11', '', '10050')
ON DUPLICATE KEY UPDATE hostid=hostid;

-- Хост 2: zabbix-docker (IP 172.19.0.40, порт 10050)
INSERT INTO hosts (hostid, host, name, status)
VALUES (10002, 'zabbix-docker', 'zabbix-docker', 0)
ON DUPLICATE KEY UPDATE host=host;

INSERT INTO hosts_groups (hostid, groupid)
VALUES (10002, @groupid)
ON DUPLICATE KEY UPDATE hostid=hostid;

INSERT INTO interface (interfaceid, hostid, main, type, useip, ip, dns, port)
VALUES (10002, 10002, 1, 1, 1, '172.19.0.40', '', '10050')
ON DUPLICATE KEY UPDATE hostid=hostid;

-- Хост 3: prakt-srv (IP 172.19.0.1, порт 10052)
INSERT INTO hosts (hostid, host, name, status)
VALUES (10003, 'prakt-srv', 'prakt-srv', 0)
ON DUPLICATE KEY UPDATE host=host;

INSERT INTO hosts_groups (hostid, groupid)
VALUES (10003, @groupid)
ON DUPLICATE KEY UPDATE hostid=hostid;

INSERT INTO interface (interfaceid, hostid, main, type, useip, ip, dns, port)
VALUES (10003, 10003, 1, 1, 1, '172.19.0.1', '', '10052')
ON DUPLICATE KEY UPDATE hostid=hostid;
