var isAUser;
var userEmail;

// Your web app's Firebase configuration
  var firebaseConfig = {
    apiKey: "AIzaSyA9QyG1gK0N_NM_4ICuRKwwKqhI3YKcmaI",
    authDomain: "bpt-game.firebaseapp.com",
    databaseURL: "https://bpt-game.firebaseio.com",
    projectId: "bpt-game",
    storageBucket: "bpt-game.appspot.com",
    messagingSenderId: "467389037874",
    appId: "1:467389037874:web:1f9eb43fa85572b394eb2b",
    measurementId: "G-KKZM0DTYFF"
  };
// Initialize Firebase
firebase.initializeApp(firebaseConfig);



// when the window onloads
window.onload = function () {

  console.log("window loaded");
  console.log(document.URL);

    // create a consts for the inputs in order to sign in
    
    

    
  
    const loginbtn = document.getElementById("login");
    console.log("loginbtn created, id: " + loginbtn.id);
    const loginEmail = document.getElementById("email");
    console.log("loginEmail created, id: " + loginEmail.id);
    const loginPassword = document.getElementById("password");
    console.log("loginPassword created, id: " + loginPassword);
    // If login button exists and is clicked sign in
    if (loginbtn) {
      loginbtn.addEventListener('click', e => {

        console.log("loginbtn clicked");
        const email = loginEmail.value;
        const password = loginPassword.value;

        console.log(email + ", " + password);

        const auth = firebase.auth();
        
    
        //error
        const promise = auth.signInWithEmailAndPassword(email, password).catch(function (error) {
          var errorCode = error.code;
          var errorMessage = error.message;

          if (errorCode === 'auth/wrong-password') {
            alert('wrong password');
          }
          else {
            alert('errorMessage');
          }
          console.log(error);
        });
        
      });
      console.log("before init");
      
      initApp();
    
      
  
  }


  const submitbtn = document.getElementById("signUpSubmit");
  console.log("submitbtn created, id: " + submitbtn.id);
  if (submitbtn) {
      submitbtn.addEventListener('click', e => {

    const submitbtn = document.getElementById("signUpSubmit");
    console.log("signUpSubmitbtn created, id: " + submitbtn.id);

    const signUpEmail = document.getElementById("email");
    console.log("signUpEmail created, id: " + signUpEmail.id);

    const signUpPassword = document.getElementById("password");
    console.log("signUpPassword created, id: " + signUpPassword.id);

    console.log(signUpEmail);

    
        console.log(signUpEmail);

        console.log(signUpEmail.value + ", " + signUpPassword.value);
        const email = signUpEmail.value;
        const password = signUpPassword.value;

        const auth = firebase.auth();
        const promise = auth.createUserWithEmailAndPassword(email, password);
        console.log("submit again");

        promise
          .catch(e => console.log(e.message));
       
        console.log(promise);
      });

  }
function initApp() {

  // checks if user is logged in or out
  firebase.auth().onAuthStateChanged(firebaseUser => {
    console.log("check status");
    if (firebaseUser) {
      isAUser = true;
      console.log(isAUser)
      console.log("STATUS: ON")
      console.log(firebaseUser);
      window.location = "game.html"
      displayName = firebaseUser.displayName;
      userEmail = firebaseUser.email;
      userId = firebaseUser.uid;
      console.log(userId);

    }
    else {
      isAUser = false;
      console.log("not logged");
    }
  });

  firebase.auth().setPersistence(firebase.auth.Auth.Persistence.SESSION)
  .then(function() {
    // Existing and future Auth states are now persisted in the current
    // session only. Closing the window would clear any existing state even
    // if a user forgets to sign out.
    // ...
    // New sign-in will be persisted with session persistence.
    return firebase.auth().signInWithEmailAndPassword(email, password);
  })
  .catch(function(error) {
    // Handle Errors here.
    var errorCode = error.code;
    var errorMessage = error.message;
  });

}

  }

