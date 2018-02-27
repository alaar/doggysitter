// make a function, then export it, then in application.js import it with the right filepath
// call it in application.js

// function openMe(inside){
//   var i;
//   var content = document.getElementByClassName("content");
//   for(i = 0; i < content.length; i++){
//     content[i].style.display = "none";
//   }
//   document.getElementById(inside).style.display = "block";
// }


const initTabs = () => {
  document.querySelectorAll(".tab").forEach((tab)=>{
    tab.addEventListener("click", showContent);
 });
};

const showContent = (event) => {
  const content = document.querySelectorAll(".content");
  let i;
  for(i = 0; i < content.length; i++){
    content[i].style.display = "none";
  }
  const type = event.currentTarget.dataset.type;
  const selectedContent = document.getElementById(type);
  selectedContent.style.display = "block"

  document.querySelectorAll(".tab").forEach((tab)=>{
    tab.classList.remove("active");
  });
  event.currentTarget.classList.add("active");


};




 export { initTabs };
