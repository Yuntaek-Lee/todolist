import SwiftUI

struct TaskRowView: View {
    @State var task: Task
    @Environment(\.modelContext) private var context
    
    var body: some View {
        HStack(alignment: .top, spacing: 15){
            Circle()
                .fill(.darkBlue)
                .frame(width: 10, height: 10)
                .padding(4)
                .background(.white.shadow(.drop(color: .black.opacity(0.1), radius: 3)), in: .circle)
                .overlay {
                    Circle()
                        .foregroundStyle(.clear)
                        .contentShape(.circle)
                        .frame(width: 50, height: 50)
                        .onTapGesture{
                            withAnimation(.snappy) {
                                task.isCompleted.toggle()
                            }
                        }
                }
            VStack(alignment: .leading, spacing: 8, content: {
                Text(task.taskTitle)
                    .font(.custom("Futura", size: 17))
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                
                Label(task.creationDate.format("hh:mm a"), systemImage: "clock")
                    .font(.custom("Futura", size: 13))
                    .foregroundStyle(.black)
            })
            .padding(15)
            .hSpacing(.leading)
            .background(task.tintColor, in: .rect(topLeadingRadius: 15, bottomLeadingRadius: 15))
            .strikethrough(task.isCompleted, pattern: .solid, color: .black)
            .contentShape(.contextMenuPreview, .rect(cornerRadius: 15))
            .contextMenu {
                Button("Delete Task", role: .destructive) {
                    context.delete(task)
                    try? context.save()
                }
            }
            .offset(y: -8)
        }
    }
    
    var indicatorColor: Color {
        if task.isCompleted {
            return .green
        }
        if task.creationDate.isSameHour {
            return .darkBlue
        }
        if task.creationDate.isPast {
            return .red
        }
        return .black
    }
}

#Preview {
    ContentView()
}
