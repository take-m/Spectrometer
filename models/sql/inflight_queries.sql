SELECT
  si.pid,
  u.usename AS user,
  qs.state,
  si.xid,
  qs.exec_time / 1000000 AS exec_time,
  qs.queue_time / 1000000 AS queue_time,
  si.starttime,
  si.text
FROM
  stv_inflight AS si
  LEFT JOIN stv_wlm_query_state AS qs
    ON si.query = qs.query
  LEFT JOIN pg_user AS u
    ON u.usesysid = si.userid
ORDER BY
  starttime
