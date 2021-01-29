FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {"test@example"}
    password              {"neco345"}
    password_confirmation {"neco345"}
    first_name            {"智也"} 
    last_name             {"長瀬"}
    first_name_reading    {"トモヤ"}
    last_name_reading     {"ナガセ"}
    birthday              {"1978-11-7"}
  end
end
