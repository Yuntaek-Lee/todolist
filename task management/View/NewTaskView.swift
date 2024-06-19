import SwiftUI

struct NewTaskView: View{
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    @State private var taskTitle: String = ""
    @State private var taskDate: Date = .init()
    @State private var taskColor: String = "TaskColor1"
    
    var body: some View{
        VStack(alignment: .leading, spacing: 15, content: {
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.title)
                    .tint(.red)
            })
            .hSpacing(.leading)
            
            VStack(alignment: .leading, spacing: 8, content: {
                Text("Task Title")
                    .font(.custom("Futura", size: 14))
                    .foregroundColor(.black)
                
                TextField("Enter Task", text: $taskTitle)
                    .font(.custom("Futura", size: 16))
                    .padding(.vertical, 12)
                    .padding(.horizontal, 15)
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 6)
                    )
            })
            .padding(.top, 5)
            
            HStack(spacing: 12){
                VStack(alignment: .leading, spacing: 8, content: {
                    Text("Task Date")
                        .font(.custom("Futura", size: 14))
                        .foregroundColor(.black)
                    
                    DatePicker("", selection: $taskDate)
                        .datePickerStyle(.compact)
                        .scaleEffect(0.9, anchor: .leading)
                })
                .padding(.top, 5)
                .padding(.trailing, -15)
                
                VStack(alignment: .leading, spacing: 8, content: {
                    Text("Task Color")
                        .font(.custom("Futura", size: 14))
                        .foregroundColor(.black)
                    
                    let colors: [String] = (1...5).compactMap { index -> String in
                        return "TaskColor\(index)"
                    }
                    
                    HStack(spacing: 0) {
                        ForEach(colors, id: \.self) { color in
                            Circle()
                                .fill(Color(color))
                                .frame(width: 20, height: 20)
                                .background(content: {
                                    Circle()
                                        .stroke(lineWidth: 2)
                                        .opacity(taskColor == color ? 1 : 0)
                                })
                                .hSpacing(.center)
                                .contentShape(.rect)
                                .onTapGesture {
                                    withAnimation(.snappy) {
                                        taskColor = color
                                    }
                                }
                        }
                    }
                })
                
            }
            .padding(.top, 5)
            
            Spacer(minLength: 0)
            
            Button(action: {
                let task = Task(taskTitle: taskTitle, creationDate: taskDate, tint: taskColor)
                do {
                    context.insert(task)
                    try context.save()
                    dismiss()
                } catch {
                    print(error.localizedDescription)
                }
            }, label: {
                Text("Create Task")
                    .font(.custom("Futura", size: 20))
                    .fontWeight(.semibold)
                    .textScale(.secondary)
                    .foregroundStyle(.black)
                    .hSpacing(.center)
                    .padding(.vertical, 12)
                    .background(Color(taskColor), in: .rect(cornerRadius: 10))
                
            })
            .disabled(taskTitle.isEmpty)
            .opacity(taskTitle.isEmpty ? 0.5 : 1)
        })
        .padding(15)
    }
}

#Preview {
    NewTaskView()
        .vSpacing(.bottom)
}
