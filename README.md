# focuzd

## Dark Mode

![main page](screenshots/focuzd_dark.png)

## Light Mode

<img title="" src="screenshots/focuzd_light.png" alt="main page" data-align="inline">

## Break

![](screenshots/focuzd_dark_break.png)

[![Get it from the Snap Store](https://snapcraft.io/static/images/badges/en/snap-store-black.svg)](https://snapcraft.io/focuzd)

A new pomodoro app, built with Flutter, the goal is to make a feature-equivalent to Pomotroid. Pomotroid uses electron, which makes it pretty heavy, slow to start, and resource intensive. Flutter will solve these issues while also looking nice, and later more features as well as more platforms will be added.

#### Pomotroid / Focuzd comparison

1. CPU Usage:
   Due to Flutter apps being natively compiled in machine code, the performance of Focuzd
   far exceeds that of Pomotroid, which is based on Electron, so every time you use it,
   it's like opening a chromium tab.
   Testing on my device, with the countdown on, the CPU Usage was the following:

- _Focuzd_: **0.43%**

- _Pomotroid_: **9.59%**

  ![Comparison on System Monitor](screenshots/comparison.png)

2. Download Size (Snap Store Data):

- _Focuzd_: **12.53 MB**

- _Pomotroid_: **67.08 MB**

3. architecture availability

- _focuzd_ : arm64, amd64
- _pomotroid_: amd64 _only_

4. Update Status:
   Pomotroid hasn't seen any update since 9 February of 2021

### For release 1.0

- [x] Feature equivelant to pomotroid

  - [x] start pomodoro sessions

  - [x] show time remaining

  - [x] show how many sessions you have done in this round

  - [x] go to the next session

  - [x] reset the session

  - [x] skip the session

    - [x] change the time lentgh of focus time

    - [x] change the time lentgh of break

    - [x] change the time lentgh of long break

    - [x] change the number of rounds

    - [x] have desktop notifications

    - [x] autostart work timer

    - [x] autostart break timer

    - [x] memorise the setting's changes

    - [x] make the window be always on top(opt in)

    - [x] reset changes to default

- [x] publish to snapstore

  - [x] snap the app(unfortunately in core22 for now)
  - [x] publish the edge-beta
  - [x] publish in stable

- [x] solve the bloc-db problem

- [x] revamp settings page to be more user-friendly

- [x] fix issue, Next() not working properly when not skipping

  ### for release 1.1 minor release

- [x] add greek language support
- [x] consider adding a circular progress indicator along with the countdown

- [x] display finish time

### for release 2.0(still thinking)

- [ ] Release 2.0 ( changing 1.9 release to 2.0 with extra feature )

  - [x] add statistics and history base support
  - [x] thus clean and improve the db
  - [ ] make the db file app specific, better breaking db compatibility now than later, maybe think of a migration strategy

  - [ ] create the history & statistics page

    - [ ] See total work(focus break) time
    - [ ] See charts for week / month / year
    - [ ] See about each topic \*, and quality view in general(all subjects)

  \*:

  - [ ] Add Subject/topic support

    - [ ] Each Subject should have sub-subjects, and super-subjects, ex: School -> Sciences -> Mathematics -> Algrebra & Geometry etc.
    - [ ] The working subject should be visible on the main page
    - [ ] Subject should be optional, and the UI shouldn't be invasive

    - [ ] Together with Subjects, Goals should be implemented.
      - [ ] Goals should be **quantity-only** as well as **quantity-quality**, so you have to be able to set a goal of _6 sessions / week_, and a goal of _6 sessions of Mathematics(/Algrebra) / week_. Another idea is having a **quality-relation** type of goal, example: 2 sessions of Mathematics/_Algebra_ / 1 session of Mathematics/_Geometry_
      - [ ] Send notifications when a goal is completed

  (more to come)

  - [ ] migrate snap to core24
