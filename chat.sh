#!/bin/bash

# Define colors and formatting
bold="\033[1m"
reset="\033[0m"
colors=("31" "32" "33" "34" "35" "36")

# Function to generate a random color code
random_color() {
    local num_colors=${#colors[@]}
    local random_index=$((RANDOM % num_colors))
    echo "${colors[random_index]}"
}

# Function to display a message in a specific color
display_message() {
    local message="$1"
    local color_code="$2"
    local color="\033[9${color_code}m"
    echo -e "${color}${message}${reset}"
}

# Function to simulate a chatbot response with a random color and sleep time
chatbot_response() {
    local user_input="$1"
    local response=""
    local sleep_time=$((RANDOM % 2 + 3))  # Sleep time ranges from 3 to 4 seconds
    if [[ "$user_input" == "hello" || "$user_input" == "hi" || "$user_input" == "hey" ]]; then
        response="Hello there! How can I assist you?"
    elif [[ "$user_input" == "tell me a joke" || "$user_input" == "joke" ]]; then
        local joke_list=(
            "Why don't scientists trust atoms? Because they make up everything!"
            "Parallel lines have so much in common. It's a shame they'll never meet."
            "Why did the scarecrow win an award? Because he was outstanding in his field!"
            "What do you call someone with no body and no nose? Nobody knows."
            "Why did the math book look sad? Because it had too many problems."
            "I told my wife she was drawing her eyebrows too high. She looked surprised."
            "What do you call a fish with no eyes? Fsh."
            "Why did the tomato turn red? Because it saw the salad dressing!"
        )
        local random_joke_index=$((RANDOM % ${#joke_list[@]}))
        response="Sure, here's a joke: ${joke_list[random_joke_index]}"
    elif [[ "$user_input" == "compliment" ]]; then
        local compliments=(
            "You're looking exceptionally wonderful today!"
            "Your smile brightens up the room!"
            "You have great taste in conversation partners!"
            "You're as smart as a chatbot can get!"
            "I'm lucky to chat with someone as awesome as you!"
            "If you were a vegetable, you'd be a 'cute-cumber'!"
            "Your intelligence is only surpassed by your charm!"
        )
        local random_compliment_index=$((RANDOM % ${#compliments[@]}))
        response="${compliments[random_compliment_index]}"
    elif [[ "$user_input" == "thank you" || "$user_input" == "thanks" ]]; then
        response="You're welcome! It's my pleasure to entertain and assist you."
    elif [[ "$user_input" == "surprise" ]]; then
        local pickup_lines=(
            "Are you a Wi-Fi signal? Because I'm feeling a super-strong, ultra-mega, intergalactic connection that transcends space and time!"
            "Do you have a name, or can I call you mine? I mean, really, all mine."
            "Is your name Google? Because you have everything I've been searching for, and more."
            "Are you a magician? Whenever I look at you, everyone else disappears. Seriously, where did they go?"
            "If you were a vegetable, you'd be a 'cute-cumber'! But seriously, you're adorable."
            "Are you a campfire? Because you're hot and I want s'more of your company."
        )
        local random_pickup_index=$((RANDOM % ${#pickup_lines[@]}))
        response="I've got a surprise for you! Here's an exaggerated pick-up line:\n"
        local color_code=$(random_color)
        response+="${pickup_lines[random_pickup_index]}"
    elif [[ "$user_input" == "help" ]]; then
        response="You can interact with me by saying:\n"
        response+="1. 'hello', 'hi', or 'hey' to greet me.\n"
        response+="2. 'tell me a joke' or 'joke' for a joke.\n"
        response+="3. 'compliment' to receive a compliment.\n"
        response+="4. 'surprise' for an exaggerated pick-up line.\n"
        response+="5. 'thank you' or 'thanks' to express gratitude.\n"
        response+="6. 'help' for this list of commands."
    else
        response="I'm just a simple chatbot. Try saying 'hello,' 'tell me a joke,' ask for a 'compliment,' request a 'surprise,' say 'thank you,' or ask for 'help'!"
    fi
    local color_code=$(random_color)
    display_message "$response" "$color_code"
    sleep "$sleep_time"
}

# Display a welcome message
display_message "${bold}${pickup_lines[0]}${reset}" "$(random_color)"

# Start the interactive chat
while true; do
    read -p "> " user_input
    chatbot_response "$user_input"
    chatbot_response "compliment"
done

# Display an ending message with an exaggerated joke
ending_message="Thank you for chatting with me! Here's one more for the road:\n"
ending_message+="Why don't skeletons fight each other? Because they don't have the guts!"
display_message "${bold}${ending_message}${reset}" "$(random_color)"
