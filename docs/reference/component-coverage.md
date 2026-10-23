# Component coverage matrix

The matrix tracks whether a topic has a repository page and an initial Flutter mapping. "Source linked" means a primary design URL is linked, not that every specification detail has been verified. Status must be refreshed when upstream guidance or Flutter APIs change.

| Component | Docs | Official design source | Flutter mapping status | Platform coverage | Outstanding limitation |
|---|---|---|---|---|---|
| Buttons (filled, outlined, text, elevated) | Grouped guide | Linked | Standard widgets; verify API/version | Per-app | Expressive-specific variants not exhaustively audited |
| Icon buttons | Grouped guide | Linked | Standard widget; constructors vary | Per-app | Confirm exact variant/state |
| Button groups | Inventory link | Supplied source URL | Custom composition may be needed | Unverified | Detailed behavior not documented |
| Split buttons | Inventory link | Supplied source URL | No mapping asserted | Unverified | Design and API research needed |
| FAB / extended FAB / FAB menu | Grouped guide | Linked for FAB; others in source list | Standard FAB APIs, menu custom/version-dependent | Per-app | Expressive motion and menu behavior unverified |
| App bars / toolbars | Grouped guide | Linked | `AppBar`, `SliverAppBar` | Adaptive | Native chrome differs |
| Navigation bar | Grouped guide | Linked | `NavigationBar` | Adaptive | No universal breakpoint |
| Navigation rail | Grouped guide | Linked | `NavigationRail` | Adaptive | No universal breakpoint |
| Navigation drawer | Grouped guide | Linked | `NavigationDrawer`, `Drawer` | Adaptive | Modal/permanent behavior must be selected |
| Tabs | Grouped guide | Linked | `TabBar`, `TabBarView` | Per-app | Verify keyboard/state behavior |
| Badges | Inventory link | Supplied source URL | `Badge` API exists; verify SDK | Per-app | Expressive detail not documented |
| Cards | Grouped guide | Linked | `Card` and custom composition | Per-app | Anatomy/tokens not exhaustive |
| Carousel | Grouped guide | Linked | `CarouselView`, version-dependent | Per-app | Accessibility/source-specific behavior unverified |
| Lists / list items | Grouped guide | Linked | `ListView`, `ListTile`, custom rows | Adaptive | Expressive row details not exhaustive |
| Divider | Inventory link | Supplied source URL | `Divider` | Per-app | Component detail not documented |
| Chips | Grouped guide | Linked | Standard chip family | Per-app | Verify selection/state API |
| Checkbox / radio / switch | Grouped guide | Linked | Standard widgets | Per-app | Detailed expressive states not audited |
| Segmented buttons | Grouped guide | Linked | `SegmentedButton` | Per-app | Verify API and selection cardinality |
| Text fields | Grouped guide | Linked | `TextField`, `TextFormField` | Per-app | Anatomy/token details not exhaustive |
| Search | Grouped guide | Linked | `SearchBar`, `SearchAnchor` | Adaptive | Interaction flow app-specific |
| Sliders | Grouped guide | Linked | `Slider`, `RangeSlider` | Per-app | Verify keyboard and semantics |
| Menus | Grouped guide | Linked | Multiple APIs; choose by use case | Pointer/keyboard/touch | Focus behavior varies by API |
| Dialogs | Grouped guide | Linked | `Dialog`, `AlertDialog` | Adaptive | Desktop treatment contextual |
| Bottom sheets | Grouped guide | Linked | `BottomSheet`, modal API | Adaptive | Not suitable for all desktop contexts |
| Side sheets | Inventory link | Supplied source URL | No standard mapping asserted | Unverified | Custom/platform strategy required |
| Progress indicators | Grouped guide | Linked | Linear/circular indicators | Per-app | Verify motion and semantic status |
| Loading indicator | Grouped guide | Linked | Standard circular indicator only | Per-app | Expressive variant not presumed built in |
| Snackbar | Grouped guide | Linked | `ScaffoldMessenger`, `SnackBar` | Per-app | Verify accessible timing/actions |
| Tooltip | Grouped guide | Linked | `Tooltip` | Pointer/keyboard/touch | Not sole carrier of essential content |
| Date/time pickers | Grouped guide | Date/time URLs retained | Flutter date picker APIs; verify time picker | Locale/platform dependent | Time-picker mapping not detailed |

Coverage is intentionally honest and not exhaustive. A blank or partial claim means more source and API verification is required before production use.
