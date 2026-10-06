# Design System Specifications — Banking Application

> **Source File**: `Design System (Community).fig`  
> **Target Platform**: Flutter Mobile (iOS / Android)  
> **Base Viewport**: 390px width (Mobile Standard)  
> **Typography Family**: `Inter`  
> **Icon Library**: `Iconoir` (Stroke width: 1.5px / 2.0px)  
> **Document Purpose**: Machine-readable and agent-friendly specification for AI code generation, UI implementation, and code review.

---

## Table of Contents
1. [Design Principles & Foundations](#1-design-principles--foundations)
2. [Design Tokens: Color Palette](#2-design-tokens-color-palette)
   - [2.1 Primitive Colors](#21-primitive-colors)
   - [2.2 Neutral & Opacity Scales](#22-neutral--opacity-scales)
   - [2.3 Semantic Tokens & Aliases](#23-semantic-tokens--aliases)
3. [Design Tokens: Typography](#3-design-tokens-typography)
   - [3.1 Typeface & Weights](#31-typeface--weights)
   - [3.2 Type Scale Hierarchy](#32-type-scale-hierarchy)
4. [Design Tokens: Spacing & Sizing](#4-design-tokens-spacing--sizing)
   - [4.1 Spacing Scale](#41-spacing-scale)
   - [4.2 Corner Radius Scale](#42-corner-radius-scale)
5. [Design Tokens: Elevation & Shadows](#5-design-tokens-elevation--shadows)
6. [Component Specifications](#6-component-specifications)
   - [6.1 Button](#61-button)
   - [6.2 Button Group (Segmented Control)](#62-button-group-segmented-control)
   - [6.3 Input (Text Field & Form Controls)](#63-input-text-field--form-controls)
   - [6.4 Checkbox](#64-checkbox)
   - [6.5 Radio Button](#65-radio-button)
   - [6.6 Toggle (Switch)](#66-toggle-switch)
   - [6.7 Alert & Banner](#67-alert--banner)
   - [6.8 Badge & Chip](#68-badge--chip)
   - [6.9 Breadcrumbs](#69-breadcrumbs)
   - [6.10 Tooltip](#610-tooltip)
   - [6.11 Loader & Spinner](#611-loader--spinner)
   - [6.12 Progress Bar](#612-progress-bar)
   - [6.13 Avatar](#613-avatar)
   - [6.14 Navbar: Top (App Bar)](#614-navbar-top-app-bar)
   - [6.15 Navbar: Bottom (Navigation Bar & Home Indicator)](#615-navbar-bottom-navigation-bar--home-indicator)
   - [6.16 Pop-Up (Dialog / Modal)](#616-pop-up-dialog--modal)
   - [6.17 Action Sheet (Bottom Sheet)](#617-action-sheet-bottom-sheet)
   - [6.18 List & List Items](#618-list--list-items)
   - [6.19 Context Menu & Popover Menu](#619-context-menu--popover-menu)
   - [6.20 Pagination](#620-pagination)
   - [6.21 Page Control (Dot Indicator)](#621-page-control-dot-indicator)
   - [6.22 Stepper](#622-stepper)
   - [6.23 Tabs](#623-tabs)
   - [6.24 Dropdown (Select Menu)](#624-dropdown-select-menu)
   - [6.25 Card](#625-card)
7. [Iconography System (Iconoir)](#7-iconography-system-iconoir)
8. [Mapping to Banking Flow Specs (Spec_Banking.md)](#8-mapping-to-banking-flow-specs-spec_bankingmd)

---

## 1. Design Principles & Foundations

- **Clean & Accessible**: High-contrast ratios meeting WCAG AA standards.
- **Predictable Consistency**: Strictly alias primitive tokens to semantic tokens. Never hardcode arbitrary hex codes in Flutter widgets.
- **Touch-Friendly Target**: Minimum tap target of 44x44px or 48x48px on primary mobile interactions.
- **Device Adaptability**: Built around a 390px mobile viewport width with horizontal responsive padding (16px / 20px / 24px).

---

## 2. Design Tokens: Color Palette

### 2.1 Primitive Colors

#### Primary (Indigo/Blue Accent)
| Token Name | HEX | Flutter Color | Role / Usage |
| :--- | :--- | :--- | :--- |
| `Color/Primary/Primary-50` | `#EDEFFE` | `Color(0xFFEDEFFE)` | Light background tint, badge surfaces |
| `Color/Primary/Primary-100` | `#C8CEFC` | `Color(0xFFC8CEFC)` | Border accents, subtle focus rings |
| `Color/Primary/Primary-200` | `#AEB6FB` | `Color(0xFFAEB6FB)` | Secondary hover outlines |
| `Color/Primary/Primary-300` | `#8895F9` | `Color(0xFF8895F9)` | Medium decorative elements |
| `Color/Primary/Primary-400` | `#7181F8` | `Color(0xFF7181F8)` | Active button hover |
| `Color/Primary/Primary-500` | `#4E61F6` | `Color(0xFF4E61F6)` | **Brand Primary**, Call-to-Action buttons, Links |
| `Color/Primary/Primary-600` | `#4758E0` | `Color(0xFF4758E0)` | Pressed button state |
| `Color/Primary/Primary-700` | `#3745AF` | `Color(0xFF3745AF)` | Deep brand borders, dark contrast accents |
| `Color/Primary/Primary-800` | `#2B3587` | `Color(0xFF2B3587)` | Deep accents |
| `Color/Primary/Primary-900` | `#212967` | `Color(0xFF212967)` | Darkest primary shade |

#### Grey (Neutrals & Layout)
| Token Name | HEX | Flutter Color | Role / Usage |
| :--- | :--- | :--- | :--- |
| `Color/Grey/Grey-50` | `#F9FAFB` | `Color(0xFFF9FAFB)` | App background, card background (`surface-grey`) |
| `Color/Grey/Grey-100` | `#F3F4F6` | `Color(0xFFF3F4F6)` | Input fields fill, disabled backgrounds |
| `Color/Grey/Grey-200` | `#E5E7EA` | `Color(0xFFE5E7EA)` | Dividers, subtle borders |
| `Color/Grey/Grey-300` | `#D2D5DB` | `Color(0xFFD2D5DB)` | Border outlines, placeholder icons (`light-grey`) |
| `Color/Grey/Grey-400` | `#9EA2AE` | `Color(0xFF9EA2AE)` | Placeholder text, disabled labels (`text-disabled`) |
| `Color/Grey/Grey-500` | `#6D717F` | `Color(0xFF6D717F)` | Secondary text, captions, subtitles |
| `Color/Grey/Grey-600` | `#4D5461` | `Color(0xFF4D5461)` | Secondary content high contrast |
| `Color/Grey/Grey-700` | `#394050` | `Color(0xFF394050)` | Dark mode borders |
| `Color/Grey/Grey-800` | `#212936` | `Color(0xFF212936)` | Sub-headings, dark mode cards |
| `Color/Grey/Grey-900` | `#131927` | `Color(0xFF131927)` | **Primary Text**, Titles, Dark surface (`surface-black`) |

#### Functional Status Colors

##### Green (Success)
| Token Name | HEX | Flutter Color | Role / Usage |
| :--- | :--- | :--- | :--- |
| `Color/Green/Green-50` | `#ECF8EF` | `Color(0xFFECF8EF)` | Success alert / badge background |
| `Color/Green/Green-100` | `#C5E9CD` | `Color(0xFFC5E9CD)` | Success border outline |
| `Color/Green/Green-500` | `#43B75D` | `Color(0xFF43B75D)` | **Success Icon & Text**, Transaction received, Valid check |
| `Color/Green/Green-600` | `#3DA755` | `Color(0xFF3DA755)` | Success hover / active |
| `Color/Green/Green-900` | `#1C4D27` | `Color(0xFF1C4D27)` | Dark success text |

##### Red (Error / Danger)
| Token Name | HEX | Flutter Color | Role / Usage |
| :--- | :--- | :--- | :--- |
| `Color/Red/Red-50` | `#FDECEC` | `Color(0xFFFDECEC)` | Error alert / badge background |
| `Color/Red/Red-100` | `#FAC5C3` | `Color(0xFFFAC5C3)` | Error border outline |
| `Color/Red/Red-500` | `#EE443F` | `Color(0xFFEE443F)` | **Error Icon & Text**, Validation failed, Negative amount |
| `Color/Red/Red-600` | `#D93E39` | `Color(0xFFD93E39)` | Error active / press |
| `Color/Red/Red-900` | `#641D1A` | `Color(0xFF641D1A)` | Dark error text |

##### Yellow (Warning / Attention)
| Token Name | HEX | Flutter Color | Role / Usage |
| :--- | :--- | :--- | :--- |
| `Color/Yellow/Yellow-50` | `#FFF7E6` | `Color(0xFFFFF7E6)` | Warning alert / badge background |
| `Color/Yellow/Yellow-100` | `#FFE5B0` | `Color(0xFFFFE5B0)` | Warning border outline |
| `Color/Yellow/Yellow-500` | `#FFAA00` | `Color(0xFFFFAA00)` | **Warning Icon & Text**, Pending transaction, Caution |
| `Color/Yellow/Yellow-600` | `#E89B00` | `Color(0xFFE89B00)` | Warning active state |
| `Color/Yellow/Yellow-900` | `#6B4700` | `Color(0xFF6B4700)` | Dark warning text |

##### Blue (Info / Neutral Highlights)
| Token Name | HEX | Flutter Color | Role / Usage |
| :--- | :--- | :--- | :--- |
| `Color/Blue/Blue-50` | `#E6F4FF` | `Color(0xFFE6F4FF)` | Info alert / badge background |
| `Color/Blue/Blue-100` | `#B0DEFF` | `Color(0xFFB0DEFF)` | Info border outline |
| `Color/Blue/Blue-500` | `#0095FF` | `Color(0xFF0095FF)` | **Info Icon & Text**, General announcements |
| `Color/Blue/Blue-600` | `#0088E8` | `Color(0xFF0088E8)` | Info active state |
| `Color/Blue/Blue-900` | `#003F6B` | `Color(0xFF003F6B)` | Dark info text |

---

### 2.2 Neutral & Opacity Scales

#### White Alpha
- `White-100%`: `#FFFFFF` — `Color(0xFFFFFFFF)` (Pure white background)
- `White-90%`: `Color(0xE5FFFFFF)`
- `White-80%`: `Color(0xCCFFFFFF)`
- `White-70%`: `Color(0xB2FFFFFF)`
- `White-60%`: `Color(0x99FFFFFF)` (`text-secondary-white`)
- `White-50%`: `Color(0x80FFFFFF)`
- `White-40%`: `Color(0x66FFFFFF)`
- `White-30%`: `Color(0x4DFFFFFF)`
- `White-20%`: `Color(0x33FFFFFF)`
- `White-10%`: `Color(0x1AFFFFFF)`

#### Black Alpha
- `Black-100%`: `#000000` — `Color(0xFF000000)`
- `Black-90%`: `Color(0xE5000000)`
- `Black-80%`: `Color(0xCC000000)`
- `Black-70%`: `Color(0xB2000000)`
- `Black-60%`: `Color(0x99000000)`
- `Black-50%`: `Color(0x80000000)`
- `Black-40%`: `Color(0x66000000)`
- `Black-30%`: `Color(0x4D000000)`
- `Black-20%`: `Color(0x33000000)`
- `Black-10%`: `Color(0x1A000000)`

---

### 2.3 Semantic Tokens & Aliases

Always prefer using semantic tokens in Flutter implementations:

| Semantic Token Name | Primitive Target | HEX / Color | Description |
| :--- | :--- | :--- | :--- |
| **`surface-white`** | `Color/White/White-100%` | `#FFFFFF` | Primary screen surface, card bodies, modal background |
| **`surface-grey`** | `Color/Grey/Grey-50` | `#F9FAFB` | Background canvas, secondary card fills, grouped list containers |
| **`surface-accent`** | `Color/Primary/Primary-50` | `#EDEFFE` | Highlighted surfaces, selected chips, icon badge containers |
| **`surface-black`** | `Color/Grey/Grey-900` | `#131927` | Dark mode surface, inverted banners, bottom sheet toolbars |
| **`text-primary-black`**| `Color/Grey/Grey-900` | `#131927` | Primary body copy, headers, input field typed values |
| **`text-secondary-dark-grey`** | `Color/Grey/Grey-500` | `#6D717F` | Subtitles, field labels, metadata, timestamp, descriptions |
| **`text-primary-white`**| `Color/White/White-100%` | `#FFFFFF` | Text on primary buttons, dark headers |
| **`text-secondary-white`**| `Color/White/White-60%` | `rgba(255,255,255,0.6)` | Secondary labels on dark cards/headers |
| **`text-links`** | `Color/Primary/Primary-500` | `#4E61F6` | Hyperlinks (e.g. "Quên mật khẩu?", "Gửi lại OTP") |
| **`text-accent`** | `Color/Primary/Primary-500` | `#4E61F6` | Accented interactive labels |
| **`text-disabled`** | `Color/Grey/Grey-400` | `#9EA2AE` | Disabled buttons, inactive input placeholders |
| **`text-grey`** | `Color/Grey/Grey-400` | `#9EA2AE` | Inactive pagination, helper icons |
| **`text-light-grey`** | `Color/Grey/Grey-300` | `#D2D5DB` | De-emphasized borders/dividers |
| **`text-success`** | `Color/Green/Green-500` | `#43B75D` | Success feedback ("Đổi mật khẩu thành công", "+500,000đ") |
| **`text-info`** | `Color/Blue/Blue-500` | `#0095FF` | System notifications, informational banners |
| **`text-warning`** | `Color/Yellow/Yellow-500` | `#FFAA00` | Warnings, OTP expiring countdown |
| **`text-error`** | `Color/Red/Red-500` | `#EE443F` | Form errors ("Mật khẩu không hợp lệ", "Sai mã OTP") |
| **`icon-black`** | `Color/Grey/Grey-900` | `#131927` | Primary navigation icons, action bar icons |
| **`icon-white`** | `Color/White/White-100%` | `#FFFFFF` | Icons inside primary buttons |
| **`icon-accent`** | `Color/Primary/Primary-500` | `#4E61F6` | Active tab bar item, selected options |
| **`icon-grey`** | `Color/Grey/Grey-400` | `#9EA2AE` | Unselected tab icons, input trailing icons |
| **`icon-light-grey`** | `Color/Grey/Grey-300` | `#D2D5DB` | Disabled action icons |
| **`icon-success`** | `Color/Green/Green-500` | `#43B75D` | Checkmark, positive status |
| **`icon-info`** | `Color/Blue/Blue-500` | `#0095FF` | Information badge icon |
| **`icon-warning`** | `Color/Yellow/Yellow-500` | `#FFAA00` | Exclamation triangle |
| **`icon-error`** | `Color/Red/Red-500` | `#EE443F` | Error cross, alert icon |

---

## 3. Design Tokens: Typography

### 3.1 Typeface & Weights
- **Primary Typeface**: `Inter`
- **Supported Weights**:
  - `Regular` (`FontWeight.w400`)
  - `Semi Bold` (`FontWeight.w600`)
  - `Bold` (`FontWeight.w700`)

### 3.2 Type Scale Hierarchy

| Token Name | Font Size | Line Height | Weight | Flutter TextStyle Equivalent | Primary Usage |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Display** | 48px | 58px | Semi-Bold (600) | `TextStyle(fontSize: 48, height: 58/48, fontWeight: FontWeight.w600)` | Hero balance display, large welcome headers |
| **Heading 1** | 40px | 48px | Semi-Bold (600) | `TextStyle(fontSize: 40, height: 48/40, fontWeight: FontWeight.w600)` | Main title screens, landing headlines |
| **Heading 2** | 32px | 40px | Semi-Bold (600) | `TextStyle(fontSize: 32, height: 40/32, fontWeight: FontWeight.w600)` | Screen page headers (e.g. "Đăng nhập", "Xác minh OTP") |
| **Heading 3** | 24px | 32px | Semi-Bold (600) | `TextStyle(fontSize: 24, height: 32/24, fontWeight: FontWeight.w600)` | Modal titles, section group headers |
| **Heading 4** | 20px | 28px | Semi-Bold (600) | `TextStyle(fontSize: 20, height: 28/20, fontWeight: FontWeight.w600)` | Card titles, list headers, prominent labels |
| **Large — Regular** | 16px | 24px | Regular (400) | `TextStyle(fontSize: 16, height: 24/16, fontWeight: FontWeight.w400)` | Primary input text, list body, description copy |
| **Large — Semi Bold**| 16px | 20px / 24px| Semi-Bold (600) | `TextStyle(fontSize: 16, height: 20/16, fontWeight: FontWeight.w600)` | Button text (Giant/Large), Form labels, tab titles |
| **Medium — Regular** | 14px | 16px / 20px| Regular (400) | `TextStyle(fontSize: 14, height: 20/14, fontWeight: FontWeight.w400)` | Secondary descriptions, helper texts, table data |
| **Medium — Semi Bold**| 14px | 16px / 20px| Semi-Bold (600) | `TextStyle(fontSize: 14, height: 16/14, fontWeight: FontWeight.w600)` | Button text (Medium), badge text, list title |
| **Small — Regular** | 12px | 16px | Regular (400) | `TextStyle(fontSize: 12, height: 16/12, fontWeight: FontWeight.w400)` | Timestamp, small captions, input hints, footnotes |
| **Small — Semi Bold**| 12px | 16px | Semi-Bold (600) | `TextStyle(fontSize: 12, height: 16/12, fontWeight: FontWeight.w600)` | Button text (Small), chips, status pills |
| **Tiny — Regular** | 10px | 12px | Regular (400) | `TextStyle(fontSize: 10, height: 12/10, fontWeight: FontWeight.w400)` | Micro-badges, bottom tab item labels |
| **Tiny — Semi Bold** | 10px | 12px | Semi-Bold (600) | `TextStyle(fontSize: 10, height: 12/10, fontWeight: FontWeight.w600)` | Button text (Tiny), micro counters |

---

## 4. Design Tokens: Spacing & Sizing

### 4.1 Spacing Scale

| Token | Value | Base Units | Typical Usage |
| :--- | :--- | :--- | :--- |
| `spacing-none` | 0px | 0 | Reset margin/padding |
| `spacing-xxs` | 4px | 0.5x | Micro-spacing between icon and small label |
| `spacing-xs` | 8px | 1x | Gap between icon and button text, list item vertical gap |
| `spacing-sm` | 12px | 1.5x | Inner padding for inputs, cards, list rows |
| `spacing-md` | 16px | 2x | Screen horizontal edge padding, button horizontal padding |
| `spacing-lg` | 20px | 2.5x | Section spacing, container margins |
| `spacing-xl` | 24px | 3x | Gap between major form groups, modal padding |

### 4.2 Corner Radius Scale

| Token | Value | Flutter Equivalent | Components Using It |
| :--- | :--- | :--- | :--- |
| `radius-xxs` | 4px | `BorderRadius.circular(4)` | Micro-badges, indicator bars |
| `radius-xs` | 8px | `BorderRadius.circular(8)` | Small/Tiny buttons, Medium inputs, Tooltips, Checkboxes |
| `radius-sm` | 12px | `BorderRadius.circular(12)` | **Giant/Large/Medium buttons, Large inputs, Cards, Pop-ups, Action sheets, Toggles** |
| `radius-md` | 16px | `BorderRadius.circular(16)` | Large modals, segmented card groupings |
| `radius-lg` | 20px | `BorderRadius.circular(20)` | Rounded bottom sheet top edges |
| `radius-xl` | 24px | `BorderRadius.circular(24)` | Extra-rounded containers |
| `radius-full` | 999px / pill | `BorderRadius.circular(999)`| Avatars, Badges, Chips, Segmented toggles |

---

## 5. Design Tokens: Elevation & Shadows

Drop shadows in this design system use subtle dual-layer shadows rendered over dark-neutral tones (`rgba(19, 25, 39, ...)`):

| Elevation | Layer 1 (Blur & Spread) | Layer 2 (Blur & Spread) | Total Visual Effect / Usage |
| :--- | :--- | :--- | :--- |
| **Shadow 100** | `0px 4px 4px -2px rgba(19,25,39, 0.08)` | `0px 2px 4px -2px rgba(19,25,39, 0.12)` | Subtle hover, cards, input focus |
| **Shadow 200** | `0px 8px 8px -4px rgba(19,25,39, 0.08)` | `0px 4px 6px -4px rgba(19,25,39, 0.12)` | Sticky bottom navbar, dropdown list |
| **Shadow 300** | `0px 8px 16px -6px rgba(19,25,39, 0.08)` | `0px 6px 8px -6px rgba(19,25,39, 0.12)` | Floating action buttons, snackbars |
| **Shadow 400** | `0px 8px 24px -4px rgba(19,25,39, 0.08)` | `0px 6px 12px -6px rgba(19,25,39, 0.12)` | Pop-up dialogs, Context menus |
| **Shadow 500** | `0px 10px 32px -4px rgba(19,25,39, 0.10)` | `0px 6px 14px -6px rgba(19,25,39, 0.12)` | Action sheets, bottom drawers |
| **Shadow 600** | `0px 12px 42px -4px rgba(19,25,39, 0.12)` | `0px 8px 18px -6px rgba(19,25,39, 0.12)` | Modal overlays |
| **Shadow 700** | `0px 14px 64px -4px rgba(19,25,39, 0.12)` | `0px 8px 22px -6px rgba(19,25,39, 0.12)` | High-elevation overlays |
| **Shadow 800** | `0px 18px 88px -4px rgba(19,25,39, 0.14)` | `0px 8px 28px -6px rgba(19,25,39, 0.12)` | Deep focal overlays |

---

## 6. Component Specifications

### 6.1 Button

Buttons are the primary interactive triggers throughout the application.

#### Variants & Sizes
| Size | Height | Corner Radius | Horizontal Padding | Vertical Padding | Typography | Icon Size |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **Giant** | 56px | 12px | 24px | 16px | Large Semi-Bold (16px) | 24x24px |
| **Large** | 48px | 12px | 20px | 14px | Large Semi-Bold (16px) | 20x20px |
| **Medium**| 40px | 12px | 16px | 12px | Medium Semi-Bold (14px)| 20x20px |
| **Small** | 32px | 8px | 12px | 8px | Small Semi-Bold (12px) | 16x16px |
| **Tiny** | 24px | 8px | 8px | 6px | Tiny Semi-Bold (10px) | 12x12px |

#### Styles & States Matrix
- **Filled (Primary)**:
  - `Default`: Background `Color/Primary/Primary-500` (`#4E61F6`), Text/Icon `White-100%` (`#FFFFFF`).
  - `Hover`: Background `Color/Primary/Primary-400` (`#7181F8`).
  - `Focus`: Background `Color/Primary/Primary-500`, Border/Ring 2px `Color/Primary/Primary-200`.
  - `Press / Active`: Background `Color/Primary/Primary-600` (`#4758E0`).
  - `Disabled`: Background `Color/Grey/Grey-200` (`#E5E7EA`), Text/Icon `Color/Grey/Grey-400` (`#9EA2AE`).
- **Outline (Secondary)**:
  - `Default`: Background `Transparent` / `White`, Border 1px `Color/Grey/Grey-300`, Text `Color/Grey/Grey-900`.
  - `Hover`: Background `Color/Grey/Grey-50`, Border 1px `Color/Grey/Grey-400`.
  - `Focus`: Border 1px `Color/Primary/Primary-500`.
  - `Press`: Background `Color/Grey/Grey-100`.
  - `Disabled`: Border 1px `Color/Grey/Grey-200`, Text `Color/Grey/Grey-400`.
- **Clear (Ghost / Text Button)**:
  - `Default`: Background `Transparent`, Text `Color/Primary/Primary-500`.
  - `Hover / Press`: Background `Color/Primary/Primary-50` (`#EDEFFE`).
  - `Disabled`: Text `Color/Grey/Grey-400`.
- **Content Variations**:
  - `Text Only`: Centered text label.
  - `Icons + Text`: Leading icon, Text, Trailing icon (optional). Gap = 8px.
  - `Only Icons`: Square aspect ratio (56x56, 48x48, 40x40, 32x32, 24x24px).

---

### 6.2 Button Group (Segmented Control)
- **Role**: Segmented tabs or toggle filters (e.g. Day / Week / Month / Year).
- **Structure**: Group container with `radius-sm` (12px), background `surface-grey` (`#F9FAFB`), inner padding 4px.
- **Item States**:
  - Active: Background `surface-white` (`#FFFFFF`), Shadow 100, Text `text-primary-black`.
  - Inactive: Background `Transparent`, Text `text-secondary-dark-grey`.

---

### 6.3 Input (Text Field & Form Controls)

Form inputs handle user data entry for login, OTP, phone verification, and password creation.

#### Anatomy & Dimensions
- **Total Component**: Vertical Auto-Layout (`gap: 6px` or `8px`).
  1. **Label**: Height 24px, Typography: Large Semi-Bold (16px) or Medium (14px), Color: `text-primary-black` (`#131927`).
  2. **Input Box**:
     - `Large`: Height **48px**, Radius **12px**, Padding: horizontal 12px, vertical 12px.
     - `Medium`: Height **40px**, Radius **8px**, Padding: horizontal 12px, vertical 8px.
  3. **Helper / Error Text**: Height 20px, Typography: Medium Regular (14px) or Small (12px).

#### Styles
- **Outline Style**: Background `#FFFFFF`, Border 1px solid.
- **Filled Style**: Background `surface-grey` (`#F9FAFB`), Border 1px subtle.

#### Input States
| State | Border Color | Fill Color | Text Color | Icon / Indicator |
| :--- | :--- | :--- | :--- | :--- |
| **Default** | `Color/Grey/Grey-300` | `#FFFFFF` or `#F9FAFB` | Placeholder: `Grey-400` | Optional leading icon |
| **Filled** | `Color/Grey/Grey-300` | Same | Typed text: `Grey-900` | Clear (X) icon button |
| **Hover** | `Color/Grey/Grey-400` | Same | `Grey-900` | - |
| **Focus** | `Color/Primary/Primary-500`| Same | `Grey-900` | Focus ring / Cursor active |
| **Success** | `Color/Green/Green-500` | `Green-50` (tinted) | `Green-500` | Green checkmark trailing icon |
| **Info** | `Color/Blue/Blue-500` | `Blue-50` (tinted) | `Blue-500` | Info circle trailing icon |
| **Warning** | `Color/Yellow/Yellow-500`| `Yellow-50` (tinted) | `Yellow-500` | Warning triangle trailing icon |
| **Error** | `Color/Red/Red-500` | `Red-50` (tinted) | `Red-500` | Error helper text below |
| **Disabled**| `Color/Grey/Grey-200` | `Grey-100` | `Grey-400` | Non-editable |

---

### 6.4 Checkbox
- **Size**: 24x24px (Tap target 44x44px padding).
- **Corner Radius**: 6px (`radius-xs`).
- **States**:
  - `Default (Unchecked)`: Border 1.5px `Grey-300`, background `Transparent`.
  - `Selected (Checked)`: Background `Color/Primary/Primary-500`, checkmark icon `White`.
  - `Indeterminate`: Background `Color/Primary/Primary-500`, minus line `White`.
  - `Disabled`: Border/Background `Grey-200`, checkmark `Grey-400`.
- **Text Alignment**: Left or Right aligned label, gap = 8px (`spacing-xs`).

---

### 6.5 Radio Button
- **Size**: 24x24px.
- **Shape**: Fully rounded circle (`radius-full`).
- **States**:
  - `Default (Unselected)`: Outer ring 1.5px `Grey-300`, inner fill `Transparent`.
  - `Selected`: Outer ring 1.5px `Primary-500`, inner solid dot 10px `Primary-500`.
  - `Disabled`: Ring `Grey-200`, dot `Grey-300`.
- **Text Alignment**: Left or Right aligned label, gap = 8px.

---

### 6.6 Toggle (Switch)
- **Track Dimensions**: 44px width x 24px height, corner radius: 12px (`radius-sm`).
- **Thumb (Knob)**: 20x20px circle, corner radius: 10px, background `#FFFFFF`, drop shadow.
- **States**:
  - `Off (Inactive)`: Track background `Grey-200` (`#E5E7EA`), thumb on the left (2px margin).
  - `On (Active)`: Track background `Color/Primary/Primary-500` (`#4E61F6`), thumb on the right (2px margin).
  - `Disabled`: Track background `Grey-100`, thumb `Grey-300`.
- **With Label**: Horizontal layout with label Left or Right.

---

### 6.7 Alert & Banner
- **Dimensions**: Full width or Container 418x116px (padded).
- **Corner Radius**: 12px (`radius-sm`).
- **Styles**:
  - `Outline`: Border 1px in state color, background tinted (e.g. `Green-50`, `Red-50`, `Yellow-50`, `Blue-50`).
  - `Filled`: Solid filled background.
- **Content Hierarchy**:
  - Leading status icon (24x24px).
  - Title (Heading 4 / Medium Semi-Bold) + Body message (Medium Regular).
  - Action buttons: Text button (e.g. "Chi tiết", "Thử lại") + Close (X) icon button.

---

### 6.8 Badge & Chip
- **Sizes**:
  - `Medium`: Height 40px, padding 8px horizontal, icon 20px.
  - `Small`: Height 32px, padding 8px horizontal, icon 16px.
  - `Tiny`: Height 24px, padding 6px horizontal, icon 12px.
- **Corner Radius**: 8px or Pill (999px).
- **Styles**: `Filled` (Soft background + colored text) and `Outline` (1px border).
- **Variants**: Default, Success (Green), Info (Blue), Warning (Yellow), Error (Red).

---

### 6.9 Breadcrumbs
- **Height**: 40px.
- **Levels**: 2 to 5 breadcrumb items.
- **Divider**: Chevron right (`arrow-right` or `slash`) 16x16px `Grey-400`.
- **Active / Current**: `text-primary-black` Semi-Bold.
- **Inactive / Parent**: `text-secondary-dark-grey` Regular.

---

### 6.10 Tooltip
- **Dimensions**: Auto width x 32px height, padding: horizontal 8px, vertical 6px.
- **Corner Radius**: 8px (`radius-xs`).
- **Background**: `surface-black` (`#131927`), Text: `text-primary-white` Small Regular (12px).
- **Placements**: `Top`, `Bottom`, `Left`, `Right` with 4px arrow indicator.

---

### 6.11 Loader & Spinner
- **Shape**: Circular spinning ring with gradient stroke.
- **Sizes**: Giant (56px), Large (48px), Medium (40px), Small (32px), Tiny (24px).
- **Colors**: `Primary-500` or `White-100%` (for inside primary buttons).

---

### 6.12 Progress Bar
- **Track Height**: 8px or 20px (with text label).
- **Corner Radius**: 4px or 8px.
- **Background Track**: `Grey-200` (`#E5E7EA`).
- **Fill Indicator**: `Color/Primary/Primary-500` (`#4E61F6`).
- **Steps / States**: 0%, 20%, 40%, 60%, 80%, 100%.
- **Label**: Left or right percentage text (e.g. "60%").

---

### 6.13 Avatar
- **Shape**: Circular (`radius-full`).
- **Sizes**:
  - `XXXL Giant`: 96x96px
  - `XXL Giant`: 80x80px
  - `XL Giant`: 64x64px
  - `Giant`: 56x56px
  - `Large`: 48x48px (Standard user profile)
  - `Medium`: 40px (List row avatar)
  - `Small`: 32px
  - `Tiny`: 24px (Table / compact row)
- **Types**:
  1. `Image`: Cropped user profile photo.
  2. `Letter`: Initials (e.g. "JD"), background `surface-accent` (`#EDEFFE`), text `Primary-500`.
  3. `Icon`: Default user silhouette icon.

---

### 6.14 Navbar: Top (App Bar)
- **Dimensions**: Width 390px, Height 44px (excluding safe area top status bar).
- **Layout**: Horizontal Auto-Layout (`padding: 0 16px`, `alignment: center`).
- **Content Variations**:
  1. `Title`: Centered Heading 4 (20px Semi-Bold) or Large (16px Semi-Bold).
  2. `Title + Secondary Text`: Title + Subtitle (12px Regular).
  3. `Left Item`: Back chevron (`arrow-left`), Menu icon, or Close (X).
  4. `Right Item`: Action icon (Notification bell, Search, Help, Face ID).

---

### 6.15 Navbar: Bottom (Navigation Bar & Home Indicator)
- **Dimensions**:
  - Bar Height: **48px**
  - Home Indicator safe area: **34px**
  - Total Height: **82px** (Width: 390px).
- **Item Count**: 2, 3, 4, or 5 tabs (Standard banking: 5 tabs).
- **Styles**:
  - `Text + Icon`: Icon 24px + Label 10px/12px stacked vertically.
  - `Line Selector + Icon`: Top indicator line (2px) on active tab.
- **States**:
  - Active: Icon & Text `Color/Primary/Primary-500`.
  - Inactive: Icon & Text `Color/Grey/Grey-400`.

---

### 6.16 Pop-Up (Dialog / Modal)
- **Dimensions**: Width 350px, Corner Radius: **12px** (`radius-sm`).
- **Background**: `surface-white` (`#FFFFFF`), Shadow: Shadow 400.
- **Padding**: 24px all around.
- **Layout Variations**:
  1. `Text + Horizontal Buttons`: Title + Body message + 2 buttons side-by-side (Cancel / Confirm). Height: 188px.
  2. `Text + Vertical Buttons`: Title + Body + 2 stacked buttons (Primary on top, Outline on bottom). Height: 252px.
  3. `Text + Input + Horizontal Buttons`: Title + Body + Input field + 2 buttons. Height: 260px.
  4. `Text + Input + Vertical Buttons`: Title + Body + Input field + 2 stacked buttons. Height: 324px.

---

### 6.17 Action Sheet (Bottom Sheet)
- **Dimensions**: Width 350px (or full 390px), Corner Radius: Top-left 20px, Top-right 20px.
- **Background**: `surface-white` (`#FFFFFF`), Shadow: Shadow 500.
- **Padding**: 16px to 24px.
- **Layout Variations**:
  1. `Actions + Button`: Action items list (destructive in Red-500) + Cancel button. Height: ~310px.
  2. `Message + Actions + Button`: Title + Explanatory text + Action rows + Cancel. Height: ~410px.

---

### 6.18 List & List Items

Standard component for transaction history, settings menus, and account option lists.

#### Anatomy
- **Row Dimensions**: Width 350px (or 390px edge-to-edge), Height: **56px** (single-line) or **64px** / **72px** (multi-line).
- **Background**: `surface-white` (`#FFFFFF`) or `surface-grey` (`#F9FAFB`).
- **Left Slot**:
  - `Icon + Text`: Leading icon (24x24px inside 40x40 container) + Title + Subtitle.
  - `Avatar + Text`: User/Merchant avatar (32px or 40px) + Title + Timestamp/Card.
- **Right Slot**:
  - `Text + Icon`: Amount (e.g. "+500,000đ" in `Green-500` or "-120,000đ" in `Grey-900`) + Chevron right.
  - `Badge + Icon`: Status chip (e.g. "Thành công") + Chevron.
  - `Toggle`: Active/Inactive switch.
  - `Radio` / `Checkbox`: Selection indicators.
  - `Stepper`: Quantity / Count control.
- **Group Container (`List - 5 Rows`)**: 5 stacked rows with 1px `Grey-200` divider between them.

---

### 6.19 Context Menu & Popover Menu
- **Dimensions**: Width 240px, Corner Radius: 12px.
- **Item Height**: 48px, horizontal padding 16px.
- **Anatomy**: Icon (20px) + Text (14px Medium) + optional shortcut or chevron.
- **States**: Default, Hover (`Grey-50`), Press (`Grey-100`), Selected.

---

### 6.20 Pagination
- **Item Dimensions**: 48x48px (or 40x40px).
- **Types**: Page Number Text or Prev/Next Arrow Icon.
- **States**:
  - Default: Border 1px `Grey-300`, text `Grey-900`.
  - Selected: Background `Primary-500`, text `White-100%`.
  - Disabled: Border 1px `Grey-200`, text `Grey-300`.

---

### 6.21 Page Control (Dot Indicator)
- **Dot Size**: 8x8px circular dot.
- **Layout**: Horizontal (144x24px container) or Vertical (24x144px).
- **States**:
  - Active dot: Width 24px (expanded pill) or 8px, background `Primary-500`.
  - Inactive dot: 8x8px, background `Grey-300`.
  - Reduced dots: 6x6px, 4x4px for carousel overflows.

---

### 6.22 Stepper
- **Dimensions**: Width 98px, Height 32px.
- **Corner Radius**: 8px (`radius-xs`).
- **Anatomy**: Minus (-) button, Value text (14px Semi-Bold), Plus (+) button.
- **Styles**: `Filled` (Grey-50 background) and `Outline` (1px Grey-300 border).

---

### 6.23 Tabs
- **Dimensions**: Height 40px.
- **Tab Counts**: 2, 3, 4, 5 tabs.
- **Active Indicator**: Bottom border 2px solid `Color/Primary/Primary-500`.
- **Typography**: Active is Medium Semi-Bold (14px `Primary-500`), Inactive is Medium Regular (`Grey-500`).

---

### 6.24 Dropdown (Select Menu)
- **Collapsed Field**: 350x48px, Radius 12px, Border 1px `Grey-300`, Chevron-down icon.
- **Expanded Menu**: Width 350px, Height up to 288px (5 items scrollable), Shadow 200, Radius 12px.
- **Item Selection**: Active checkmark, hover background `surface-grey`.

---

### 6.25 Card
Cards encapsulate distinct content units (e.g. Account balance, Credit card display, Quick action summaries).

#### Variants
1. **Card (Vertical)**:
   - Dimensions: Width 350px, Height 452px.
   - Anatomy:
     - Top Image banner: 350x200px (12px top corner radius).
     - Body Content: 350x252px with 24px padding (`spacing-xl`).
     - Title (Heading 3: 24px Semi-Bold) + Description (16px Regular).
     - Buttons group: 2 buttons (Primary + Secondary).
2. **Card (Horizontal - Small)**:
   - Dimensions: Width 350px, Height 120px, Corner Radius: 12px (`radius-sm`).
   - Anatomy: Left thumbnail image (120x120px) + Right content area (230x120px, 16px padding).
   - Content: Title (16px Semi-Bold) + Subtitle (14px Regular).

---

## 7. Iconography System (Iconoir)

The system embeds the open-source **Iconoir** icon set (`24x24px` grid, default 1.5px/2.0px stroke).

### 46 Icon Categories Included
1. `Navigation` (arrows, chevrons, compass, menu, expand, collapse)
2. `Finance` (bank, wallet, card-wallet, credit-card, coin, cash, piggy-bank, send-dollars, receive-dollars, card-security, card-locked)
3. `Security` (lock, unlock, key, shield, fingerprint, face-id, scan)
4. `Actions` (plus, minus, edit, trash, share, download, upload, refresh)
5. `Analytics` (chart, graph, pie-chart, trend-up, trend-down)
6. `Communication` (chat, message, phone, mail, bell, notification)
7. `Users` (user, users, user-circle, user-badge, add-user)
8. `System` (settings, cog, power, check, xmark, info-circle, warning-triangle)
9. *Additional Categories*: Organization, Development, Emojis, Activities, Design Tools, 3D Editor, Animations, Audio, Animals, Buildings, Business, Clothing, Cloud, Connectivity, Database, Docs, Editor, Food, Gaming, Git, Gestures, Health, Home, Layout, Maps, Music, Other, Nature, Photos/Videos, Shapes, Shopping, Science, Social, Transport, Tools, Weather, Identity, Devices.

### Flutter Implementation Recommendation
- Use the official [`iconoir_flutter`](https://pub.dev/packages/iconoir_flutter) package or include raw SVGs in `assets/icons/`.
- Default sizing:
  - Button icons: 20px / 24px.
  - Form input icons: 20px.
  - Bottom navigation bar: 24px.
  - List row icons: 24px inside a 40x40px container.

---

## 8. Mapping to Banking Flow Specs (`Spec_Banking.md`)

This table maps the functional touchpoints from `Spec_Banking.md` to the components and design tokens defined in this document:

| Touchpoint ID | Screen Name | Required Design System Components | Relevant Design Tokens | Notes & Interactions |
| :--- | :--- | :--- | :--- | :--- |
| **UIT-01** | **Màn hình Đăng nhập** | • `Navbar: Top` (Title only)<br>• `Input (Large, Outline/Filled)`: Tên đăng nhập & Mật khẩu<br>• `Checkbox`: Ghi nhớ đăng nhập<br>• `Button (Clear)`: Quên mật khẩu?<br>• `Button (Giant, Filled)`: Đăng nhập<br>• `Button (Large, Outline)`: Face ID | • `text-primary-black`<br>• `text-links`<br>• `Primary-500`<br>• `radius-sm` (12px)<br>• `spacing-xl` (24px) | Password input has trailing eye icon toggle; Face ID triggers biometric prompt; Tap "Quên mật khẩu?" navigates to UIT-03. |
| **UIT-02** | **Trang chủ sau đăng nhập** | • `Navbar: Top`: Avatar (40px) + Greeting + Bell notification icon<br>• `Card`: Balance summary card with `Primary-500` gradient<br>• `Button Group`: Quick actions (Chuyển tiền, Hóa đơn, Nạp tiền)<br>• `List (5 Rows)`: Recent transactions<br>• `Navbar: Bottom (5 Tabs)`: Home, Chuyển tiền, Lịch sử, Thẻ, Cài đặt | • `Display` / `Heading 2`<br>• `surface-grey`<br>• `icon-success`<br>• `icon-error`<br>• `Shadow 100` / `200` | Displays balance, quick transfer triggers, transaction history with received (+Green-500) and spent (-Grey-900) amounts. |
| **UIT-03** | **Xác thực tài khoản** | • `Navbar: Top`: Back chevron + Title "Xác thực tài khoản"<br>• `Input (Large, Outline)`: Số điện thoại đã đăng ký<br>• `Button (Giant, Filled)`: Gửi mã OTP | • `Heading 2`<br>• `text-secondary-dark-grey`<br>• `Primary-500` | Phone number formatting (masking support); Submit triggers OTP dispatch and navigates to UIT-04. |
| **UIT-04** | **Xác minh OTP** | • `Navbar: Top`: Back chevron<br>• `Input`: 4 or 6 individual OTP digit boxes (`48x56px` each, `radius-xs`)<br>• `Progress Bar` / Countdown text: Thời gian hiệu lực mã<br>• `Button (Clear)`: Gửi lại mã OTP<br>• `Button (Giant, Filled)`: Xác nhận OTP<br>• `Alert (Outline, Error)`: Báo lỗi sai mã / hết hạn | • `text-warning`<br>• `text-error`<br>• `Green-500`<br>• `radius-xs` (8px)<br>• `spacing-md` (16px) | Inline countdown timer; Auto-focus next digit box; Success redirects to UIT-05. |
| **UIT-05** | **Đặt mật khẩu mới** | • `Navbar: Top`: Back chevron<br>• `Input (Large, Outline)`: Mật khẩu mới & Nhập lại mật khẩu mới (Show/Hide eye icon)<br>• `List`: Danh sách tiêu chí bảo mật (Checkmark icon Green/Grey)<br>• `Button (Giant, Filled)`: Cập nhật mật khẩu | • `icon-success`<br>• `text-error`<br>• `Primary-500`<br>• `radius-sm` (12px) | Real-time criteria validation; Error banner if confirmation does not match; Success redirects to UIT-06. |
| **UIT-06** | **Đổi mật khẩu thành công** | • `Badge` / Circular Icon container: Large Checkmark (`icon-success`, 80x80px)<br>• Typography: `Heading 2` ("Đổi mật khẩu thành công") + `Medium Regular` body<br>• `Button (Giant, Filled)`: Quay lại đăng nhập | • `Green-500`<br>• `Green-50`<br>• `surface-white`<br>• `spacing-xl` (24px) | Standalone confirmation display; No automatic login; Tap button navigates back to UIT-01. |

---

## 9. Flutter Code Snippets & Token Constants Reference

For instant use by Flutter code generation agents, here are the core class constants:

```dart
import 'package:flutter/material.dart';

abstract class AppColors {
  // Primitives - Primary
  static const Color primary50 = Color(0xFFEDEFFE);
  static const Color primary100 = Color(0xFFC8CEFC);
  static const Color primary200 = Color(0xFFAEB6FB);
  static const Color primary300 = Color(0xFF8895F9);
  static const Color primary400 = Color(0xFF7181F8);
  static const Color primary500 = Color(0xFF4E61F6); // Brand Primary
  static const Color primary600 = Color(0xFF4758E0);
  static const Color primary700 = Color(0xFF3745AF);
  static const Color primary800 = Color(0xFF2B3587);
  static const Color primary900 = Color(0xFF212967);

  // Primitives - Grey
  static const Color grey50 = Color(0xFFF9FAFB);
  static const Color grey100 = Color(0xFFF3F4F6);
  static const Color grey200 = Color(0xFFE5E7EA);
  static const Color grey300 = Color(0xFFD2D5DB);
  static const Color grey400 = Color(0xFF9EA2AE);
  static const Color grey500 = Color(0xFF6D717F);
  static const Color grey600 = Color(0xFF4D5461);
  static const Color grey700 = Color(0xFF394050);
  static const Color grey800 = Color(0xFF212936);
  static const Color grey900 = Color(0xFF131927);

  // Functional Status
  static const Color success = Color(0xFF43B75D);
  static const Color successBg = Color(0xFFECF8EF);
  static const Color error = Color(0xFFEE443F);
  static const Color errorBg = Color(0xFFFDECEC);
  static const Color warning = Color(0xFFFFAA00);
  static const Color warningBg = Color(0xFFFFF7E6);
  static const Color info = Color(0xFF0095FF);
  static const Color infoBg = Color(0xFFE6F4FF);

  // Semantic Surfaces
  static const Color surfaceWhite = Color(0xFFFFFFFF);
  static const Color surfaceGrey = grey50;
  static const Color surfaceAccent = primary50;
  static const Color surfaceBlack = grey900;

  // Semantic Text & Icons
  static const Color textPrimary = grey900;
  static const Color textSecondary = grey500;
  static const Color textDisabled = grey400;
  static const Color textLinks = primary500;
}

abstract class AppRadius {
  static const double xxs = 4.0;
  static const double xs = 8.0;
  static const double sm = 12.0; // Standard for buttons, cards, inputs
  static const double md = 16.0;
  static const double lg = 20.0;
  static const double xl = 24.0;
  static const double full = 999.0;

  static final BorderRadius buttonRadius = BorderRadius.circular(sm);
  static final BorderRadius cardRadius = BorderRadius.circular(sm);
  static final BorderRadius inputRadius = BorderRadius.circular(sm);
}

abstract class AppSpacing {
  static const double none = 0.0;
  static const double xxs = 4.0;
  static const double xs = 8.0;
  static const double sm = 12.0;
  static const double md = 16.0;
  static const double lg = 20.0;
  static const double xl = 24.0;
}
```
