const pay = () => {
  Payjp.setPublicKey("pk_test_92467e2c44790cb477300463");
  const form = document.getElementById("charge-form");
   form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("address_form[number]"),
      cvc: formData.get("address_form[cvc]"),
      exp_month: formData.get("address_form[exp_month]"),
      exp_year: `20${formData.get("address_form[exp_year]")}`,
    };
    console.log(card);
    Payjp.createToken(card, (status, response) => {
      if (status === 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
       const tokenObj = `<input value=${token} name='card_token' type="hidden">`; 
        renderDom.insertAdjacentHTML("beforeend", tokenObj);

       document.getElementById("card-number").removeAttribute("name");
       document.getElementById("card-cvc").removeAttribute("name");
       document.getElementById("card-exp-month").removeAttribute("name");
       document.getElementById("card-exp-year").removeAttribute("name");

       document.getElementById("charge-form").submit();
     }
   });
 });
};

window.addEventListener("load", pay);