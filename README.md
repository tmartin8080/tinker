# Testing Fundamentals

There are 2 parts to this, one where we establish some language and a mental
model for testing, and a practical part where we apply some principles and
see this mental model in action.

# PART 1 - Foundation

## Why bother Testing?

> A problem well-stated is half solved. - Charles Kettering

1. *Documentation*: Testing defines problems, and verifies solutions are correct.
2. *Confidence*: Testing gives us confidence that our code works as expected.
3. *Prevent Regressions*: Testing can prevent breaking changes.

### Scenario - Without Tests

Converting routes without existing tests can be like disarming a bomb. 
- Zero documentation.
- Need to rely on author of code to try to understand how a system works. (Most times they're no longer around).
- How do we know if we've overlooked something?

### Scenerio - With Tests

1. Releasing all the policy routes into production.
  - Almost no issues.
  - One edgecase that wasn't clear in existing code, but added tests and docs in the fix. (`event`/`event_alert`)
  - Config Manager system is extensively tested.
  - Documentation explaining choices and future plans.
  - High level of confidence that it's working as expected.
  - Much easier to jump into that system and understand how everything works.

2. Bugfix for Policy scopes.
  - Documentation.
  - Prevent Regression
  - Domain knowledge
  - If scopes are changed in the application code, the tests will fail. 

## Testing Goals

- prove that your code does what it's supposed to
- prevent breaking changes (regressions)
- make it easy to find where your code is broken
- write the least amount of test code possible

## Anatomy of a Test

Tests no matter how complicated are comprised of no more than 4 stages:

- setup
- exercise
- verify
- teardown

There are tests that may only use a few of these stages, and sometimes the order
isn't straightforward, but every test can be broken down into these stages.

## Types of Tests

### 1. Unit Tests

- Focus on a subset of an application, often removing the overarching context of how the
code is used.
- Exercise 2 or fewer systems.
- Often a single function with it's private functions, but can include other Modules and functions
  that expand the scope of the "Unit".

### 2. Integration Tests

