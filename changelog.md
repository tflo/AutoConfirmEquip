To see all commits, including all alpha changes, [*go here*](https://github.com/tflo/PetWalker/commits/master/).

---

## Releases

#### 2.1.1 (2024-10-23)

- toc bump, no changes.

#### 2.1.0 (2024-08-10)

- New defaults (active at first load): Poor (0, gray), Uncommon (2, green), Rare (3, blue), and Heirloom (7) can be equipped without confirmation dialog.
    - Heirlooms can be regenerated, so no reason for a confirmation.
    - White gear (quality 1) is relatively rare (compared to grays, greens, and blues), and the chance of it being something special is relatively high. So a confirmation won’t hurt, I think.
    - This config can be (re)created with the command `/aceq 0237`.

#### 2.0.7 (2024-07-24)

- No issues found with TWW, so far.
- toc updated for TWW 110000.

#### 2.0.6 (2024-05-08)

- toc bump only (100207). Addon update will follow as needed.

#### 2.0.5 (2024-03-19)

- toc bump only. If necessary, the addon will be updated in the next days.

#### 2.0.4 (2024-01-16)

- Just a toc bump for 10.2.5. Compatibility update will follow if needed.

#### 2.0.3 (2023-11-08)

-toc update 100200; no content changes.

#### 2.0.2 (2023-09-06)

- toc bump 100107.
- Minor optimizations.

#### 2.0.1 (2023-07-12)

- toc updated for 10.1.5.
  - I have not yet had a chance to really test the addon with 10.1.5, but as far as I know there are no relevant API changes. If I find any problems, you'll get a content update soon.

#### 2.0 (2023-05-13)

- Complete rewrite, with configurable quality levels. With a slash command you can now configure the qualities that should be equippable without confirmation:
  - Examples: `/aceq 0123`, `/aceq 02`, `/aceq 2`. For details, see description or in-game help text.
  - If `/aceq` conflicts with other addons, use `/autoconfirmequip`.
  - Type just `/aceq` or `/autoconfirmequip` to get in-game help on the configuration, including a quality index. It also displays the currently set quality levels.
  - The defaults are the same as with previous versions (Poor, Common, Uncommon), so if those are fine for you, you don't need to do anything.
- Added in-game icon.
- Updated readme/description.

#### 1.0.4 (2023-05-02)

- toc: updated for 10.1

#### 1.0.3.2 (2023-03-22)

- toc: updated for 10.0.7

#### 1.0.3.1 (2023-01-25)

- toc: updated for 10.0.5

#### 1.0.3 (2022-12-31)

- toc: Added CF ID
- Minor changes to readme

#### 1.0.2 (2022-11-17)

- toc: updated for 10.0.2

#### 1.0.1 (2022-09-12)

- Fixed error in toc
- Other minor formal stuff

#### 1.0.0 (2022-09-10)

- Initial
