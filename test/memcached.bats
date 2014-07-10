#!/usr/bin/env bats

@test "It should install memcached " {
  run memcached -h
  [[ "$output" =~ "1.4.14"  ]]
}

@test "It should install SASL tools " {
  run which saslpasswd2
  [[ "$status" -eq "0"  ]]
}

@test "It should run properly, and run on port 3000 by default" {
  memcached -u root -p $PORT -d
  run sh -c "echo stats | nc localhost 3000"
  [[ "$status" -eq "0"  ]]
  [[ "$output" =~ "STAT"  ]]
  pkill memcached
}

@test "It should deny unauthenticated connections on memcached-sasl" {
  PASSWORD=foobar /usr/bin/memcached-sasl -d
  run sh -c "echo stats | nc localhost 3000"
  [[ "$status" -eq "0"  ]]
  ! [[ "$output" =~ "STAT"  ]]
  pkill memcached
}

@test "It should allow authenticated connections on memcached-sasl" {
  skip
}
