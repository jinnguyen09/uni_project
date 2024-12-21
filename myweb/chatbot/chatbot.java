import java.util.HashMap;
import java.util.Scanner;

public class ChatBot {
    public static void main(String[] args) {
        // Tạo một danh sách các câu hỏi và câu trả lời được lập trình sẵn
        HashMap<String, String> responses = new HashMap<>();
        responses.put("Hello", "Hi! How can I help you today?");
        responses.put("How are you?", "I'm just a bot, but I'm functioning as expected!");
        responses.put("What is your name?", "I'm ChatBot, your virtual assistant.");
        responses.put("Bye", "Goodbye! Have a great day!");

        // Scanner để nhận đầu vào từ người dùng
        Scanner scanner = new Scanner(System.in);

        System.out.println("ChatBot: Hi! Ask me a question or say 'Bye' to exit.");
        
        while (true) {
            System.out.print("You: ");
            String userInput = scanner.nextLine();

            // Kiểm tra nếu người dùng nói 'Bye'
            if (userInput.equalsIgnoreCase("Bye")) {
                System.out.println("ChatBot: " + responses.get("Bye"));
                break;
            }

            // Tìm câu trả lời tương ứng hoặc phản hồi mặc định
            String reply = responses.getOrDefault(userInput, "I'm sorry, I don't understand that question.");
            System.out.println("ChatBot: " + reply);
        }

        scanner.close();
    }
}
