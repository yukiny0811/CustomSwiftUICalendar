## CustomSwiftUICalendar

Fully Customizable SwiftUI Calendar

## Example Views

| Sample1 | Sample2 | Sample3 |
| - | - | - |
| ![Simulator Screen Recording - iPhone 15 Pro - 2024-06-15 at 00 00 41](https://github.com/yukiny0811/CustomSwiftUICalendar/assets/28947703/5ab09971-6df3-4454-ba16-c38c20f5cdc7) | ![Simulator Screenshot - iPhone 15 Pro - 2024-06-14 at 23 58 12](https://github.com/yukiny0811/CustomSwiftUICalendar/assets/28947703/5e2af3f6-91aa-4524-9e08-0526c1247d7e) | ![Simulator Screenshot - iPhone 15 Pro - 2024-06-15 at 00 10 03](https://github.com/yukiny0811/CustomSwiftUICalendar/assets/28947703/8a2b54fd-b625-437c-a73f-32cf7122f76f) |

## Usage

### Basic

```Sample1View.swift
import SwiftUI
import CustomSwiftUICalendar

struct Sample1View: View {

    @State var year = 2024
    @State var month = 6

    var body: some View {
        NavigationStack {
            SwiftUICalendarHorizontalScroll(year: $year, month: $month, startsFromMonday: true){ year, month, day, cellWidth, cellHeight in

                // define your custom cell here
                Text(day == 0 ? "" : String(day))
            }
            .navigationTitle(String(format: "%04d", year) + " " + String(format: "%02d", month))
        }
    }
}
```

### Some Decorations

```Sample2View.swift
import SwiftUI
import CustomSwiftUICalendar

struct Sample2View: View {

    @State var year = 2024
    @State var month = 10

    var body: some View {
        NavigationStack {
            SwiftUICalendarHorizontalScroll(year: $year, month: $month, startsFromMonday: true){ year, month, day, cellWidth, cellHeight in
                if month == 10 && day == 10 {
                    VStack {
                        Text(String(day))
                            .foregroundStyle(.background)
                    }
                    .frame(width: cellWidth, height: cellHeight)
                    .background(.cyan.opacity(0.5))
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                } else {
                    Text(day == 0 ? "" : String(day))
                }
            }
            .navigationTitle(String(format: "%04d", year) + " " + String(format: "%02d", month))
        }
    }
}
```

### More Decorations

```Sample3View.swift
struct Sample2View: View {

    @State var year = 2024
    @State var month = 10

    var body: some View {
        NavigationStack {
            SwiftUICalendarHorizontalScroll(year: $year, month: $month, startsFromMonday: true){ year, month, day, cellWidth, cellHeight in
                VStack {
                    if day == 10 {
                        Text(String(day))
                            .font(.caption2)
                            .bold()
                            .foregroundStyle(.background)
                            .frame(width: 20, height: 20)
                            .background(.cyan.opacity(0.5))
                            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                            .padding(5)
                    } else {
                        Text(String(day))
                            .font(.caption2)
                            .bold()
                            .foregroundStyle(.foreground.opacity(0.6))
                            .frame(width: 20, height: 20)
                            .padding(5)
                    }

                    if day == 10 {
                        VStack {
                            Text("Study")
                                .font(.caption2)
                                .bold()
                                .frame(width: cellWidth)
                                .foregroundStyle(.foreground.opacity(0.6))
                                .background(.pink.opacity(0.2))
                                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 3, height: 3)))
                        }
                    }
                    Spacer()
                }
                .frame(width: cellWidth, height: cellHeight)
                .border(.black.opacity(0.2), width: 0.3)
            }
            .navigationTitle(String(format: "%04d", year) + " " + String(format: "%02d", month))
        }
    }
}
```

## Credits

CustomSwiftUICalendar library is created by Yuki Kuwashima.
