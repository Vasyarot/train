import SwiftUI

struct ModalCalculationsView: View {
    let route: Route

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ScrollView {
            VStack {
                Text("Таблица расчетов")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                    .foregroundColor(.primary)

                // Первая таблица с тремя первыми пунктами
                VStack(spacing: 0) {
                    Text("Приёмка локомотива")
                        .font(.headline)
                        .padding(.vertical, 8)
                        .foregroundColor(.primary)

                    ForEach(Array(route.stages.prefix(3)), id: \.name) { stage in
                        HStack {
                            Text(stage.name)
                                .frame(width: UIScreen.main.bounds.width * 0.7 - 32, alignment: .leading) // 70% ширины
                                .padding(.vertical, 8)
                                .foregroundColor(.primary)
                            
                            Divider()
                                .background(Color.gray.opacity(0.5))
                                .frame(width: 1, height: 20)
                                .padding(.vertical, 8)
                            
                            Text(stage.time)
                                .frame(width: UIScreen.main.bounds.width * 0.3 - 32, alignment: .trailing) // 30% ширины
                                .padding(.vertical, 8)
                                .foregroundColor(.primary)
                        }
                        .padding(.horizontal)
                        
                        Divider()
                            .background(Color.gray.opacity(0.5))
                    }
                }
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .shadow(radius: 2)
                .padding(.horizontal, 16)

                // Общее время приёмки
                let totalReceptionTime = route.stages.prefix(3).compactMap { Int($0.time.replacingOccurrences(of: " мин", with: "")) }.reduce(0, +)
                Text("Общее время приёмки: \(totalReceptionTime) мин")
                    .font(.headline)
                    .padding()

                // Четвертый пункт отдельно
                if route.stages.count > 3 {
                    VStack(spacing: 0) {
                        Text(route.stages[3].name)
                            .font(.headline)
                            .padding(.vertical, 8)
                            .foregroundColor(.primary)
                        
                        Text(route.stages[3].time)
                            .font(.headline)
                            .padding(.vertical, 8)
                            .foregroundColor(.primary)
                    }
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .shadow(radius: 2)
                    .padding(.horizontal, 16)
                }

                // Пятый пункт отдельно
                if route.stages.count > 4 {
                    VStack(spacing: 0) {
                        Text(route.stages[4].name)
                            .font(.headline)
                            .padding(.vertical, 8)
                            .foregroundColor(.primary)
                        
                        Text(route.stages[4].time)
                            .font(.headline)
                            .padding(.vertical, 8)
                            .foregroundColor(.primary)
                    }
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .shadow(radius: 2)
                    .padding(.horizontal, 16)
                }

                // Таблица состояния из последних трех пунктов
                if route.stages.count > 5 {
                    VStack(spacing: 0) {
                        Text("Состояние")
                            .font(.headline)
                            .padding(.vertical, 8)
                            .foregroundColor(.primary)

                        ForEach(Array(route.stages.suffix(3)), id: \.name) { stage in
                            HStack {
                                Text(stage.name)
                                    .frame(width: UIScreen.main.bounds.width * 0.7 - 32, alignment: .leading) // 70% ширины
                                    .padding(.vertical, 8)
                                    .foregroundColor(.primary)
                                
                                Divider()
                                    .background(Color.gray.opacity(0.5))
                                    .frame(width: 1, height: 20)
                                    .padding(.vertical, 8)
                                
                                Text(stage.time)
                                    .frame(width: UIScreen.main.bounds.width * 0.3 - 32, alignment: .trailing) // 30% ширины
                                    .padding(.vertical, 8)
                                    .foregroundColor(.primary)
                            }
                            .padding(.horizontal)
                            
                            Divider()
                                .background(Color.gray.opacity(0.5))
                        }
                    }
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .shadow(radius: 2)
                    .padding(.horizontal, 16)
                }

                // Общее время сдачи
                let totalHandoverTime = route.stages.suffix(3).compactMap { Int($0.time.replacingOccurrences(of: " мин", with: "")) }.reduce(0, +)
                Text("Общее время сдачи: \(totalHandoverTime) мин")
                    .font(.headline)
                    .padding()

                Spacer()

                Button(action: {
                    // Закрыть модальное окно
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Закрыть")
                        .font(.title2)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
            .padding()
        }
        .background(Color(.systemBackground))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
