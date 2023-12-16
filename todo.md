Test Cases
==========
- [x] It has a test harness that will run the service with parameters and check it from the outside
- [ ] Full test suite can be set up to run on any* fresh machine with a ~single command.
  - [x] Mac
  - [ ] Linux
  - [ ] Windows/WSL
  - [ ] In a free/cheap remote environment of some sort
- [ ] Test harness can run multiple instances of the service with different parameters to compare their output

- [x] It answers arbitrary queries to *.test with an NXDOMAIN response.
- [x] It answers arbitrary queries to *.* with a REFUSED response.
- [ ] It answers queries to <n>.random.test with an A record pointing to a valid IP address.
  - [ ] Always under the same class C
  - [ ] Always matches the IP returned for 0.<n>.random.test
  - [ ] Always different from the IP for any other value of <n>
- [ ] It answers queries to <o>.<n>.random.test with an A record pointing to a valid IP address.
  - [ ] Always under the same class B
  - [ ] Always under the same class C for a given value of <o>
  - [ ] Always matches the IP returned for 0.<n>.random.test
  - [ ] Always matches the IP returned for 0.<n>.random.test
  - [ ] Always different from any other value of <n> or <o>
- [ ] It answers queries to <p>.<o>.<n>.random.test with an A record pointing to a valid IP address.
- [ ] It answers queries to <q>.<p>.<o>.<n>.random.test with an A record pointing to a valid IP address.
- [ ] It answers queries to one.test with an A record pointing to  <1 pseudo-random IP: matches IP at 1.random.test>.
- [ ] It answers queries to multi.test with three A records pointing to 3 pseudo-random IPs (matches IPs at [3-5].random.test).
- [ ] The same A will always return the same IP until the service is restarted
- [ ] A records pointing to random IP's will not always be the same across restarts
