# distlock

A distributed lock implementation using redis, supporting promise and typescript


[![Build Status](https://api.travis-ci.org/spearhead-ea/distlock.svg?branch=master)](https://travis-ci.org/spearhead-ea/distlock)
[![NPM version](https://badge.fury.io/js/distlock.svg)](http://badge.fury.io/js/distlock)
[![Dependency Status](https://david-dm.org/spearhead-ea/distlock/status.svg)](https://david-dm.org/spearhead-ea/distlock)
[![Coverage Status](https://coveralls.io/repos/github/spearhead-ea/distlock/badge.svg?branch=master)](https://coveralls.io/github/spearhead-ea/distlock?branch=master)

# Example
```javascript
import { DistLock } from 'distlock';
import * as redis from 'redis';

async tryToDoSomething(): Promise<void> {
	let l: DistLock;
	try {
		l = new DistLock(redis.redisClient, 'lockName');
		await l.lock();
		await this.doSomething()
	} catch (e) {
		console.log(e);
	} finally {
		await l.unlock();
	}
}
```
