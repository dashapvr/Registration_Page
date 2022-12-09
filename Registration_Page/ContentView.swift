//
//  ContentView.swift
//  Registration_Page
//
//  Created by D on 02.12.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var index = 0
    
    var body: some View {
        GeometryReader { _ in
            ZStack {
                Image("logo")
                    .ignoresSafeArea()
                Image("starbucks")
                    .resizable()
                    .frame(width: 68, height: 68)
                    .fixedSize()
                    .offset(x: -325, y: -600)
            }
            ZStack {
                SignUp(index: self.$index)
                    .zIndex(Double(self.index))
                Login(index: self.$index)
            }
            HStack(spacing: 15) {
                Rectangle()
                    .fill(Color(#colorLiteral(red: 0.6733742952, green: 0.7998645902, blue: 0.7374531031, alpha: 1)))
                    .frame(height: 1)
                    .offset(y: 550)
                
                Text("OR")
                    .offset(y: 550)
                    .foregroundColor(Color(#colorLiteral(red: 0.3087431788, green: 0.5830556154, blue: 0.4669937491, alpha: 1)))
                
                Rectangle()
                    .fill(Color(#colorLiteral(red: 0.6733742952, green: 0.7998645902, blue: 0.7374531031, alpha: 1)))
                    .frame(height: 1)
                    .offset(y: 550)
            }
            .padding(.horizontal, 30)
            .padding(.top, 50)
            
            HStack(spacing: 25) {
                Button(action: {
                    //
                }) {
                    Image("apple")
                        .resizable()
                        .renderingMode(.original)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .offset(x: 70, y: 650)
                }
                Button(action: {
                    //
                }) {
                    Image("fb")
                        .resizable()
                        .renderingMode(.original)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .offset(x: 100, y: 650)
                }
                Button(action: {
                    //
                }) {
                    Image("tw")
                        .resizable()
                        .renderingMode(.original)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .offset(x: 130, y: 650)
                }
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}

struct CShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: rect.width, y: 100))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: 0))
        }
    }
}

struct CShape1: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: 0, y: 100))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
        }
    }
}

struct Login: View {
    @State var email = ""
    @State var pass = ""
    @Binding var index: Int
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                HStack {
                    VStack(spacing: 10) {
                        Text("Login")
                            .foregroundColor(self.index == 0 ? Color.white : Color(#colorLiteral(red: 0.3789061904, green: 0.3789061904, blue: 0.3789061904, alpha: 1)))
                            .font(.title)
                            .fontWeight(.bold)
                            .offset(x: -7)
                        
                        Capsule()
                            .fill(self.index == 0 ? Color(#colorLiteral(red: 0.604090035, green: 0.8739195466, blue: 0.762126863, alpha: 1)) : Color.clear)
                            .frame(width: 100, height: 10)
                    }
                    
                    Spacer()
                    
                }.padding(.top, 10)
                
                VStack {
                    HStack(spacing: 15) {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color(#colorLiteral(red: 0.5748957992, green: 0.8344196677, blue: 0.7270953059, alpha: 1)))
                        TextField("Email Adress", text: self.$email)
                    }
                    
                    Divider()
                        .background(Color.white.opacity(0.5))
                }.padding(.horizontal)
                    .padding(.top, 40)
                
                VStack {
                    HStack(spacing: 15) {
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color(#colorLiteral(red: 0.5748957992, green: 0.8344196677, blue: 0.7270953059, alpha: 1)))
                        SecureField("Password", text: self.$pass)
                    }
                    
                    Divider()
                        .background(Color.white.opacity(0.5))
                }.padding(.horizontal)
                    .padding(.top, 30)
                
                HStack {
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        //
                    }) {
                        Text("Forget Password?")
                            .foregroundColor(Color.white.opacity(0.6))
                    }
                }.padding(.horizontal)
                    .padding(.top, 30)
            }.padding()
                .padding(.bottom, 65)
                .background(Color(#colorLiteral(red: 0.3174917996, green: 0.602907598, blue: 0.4823802114, alpha: 1)))
                .clipShape(CShape())
                .contentShape(CShape())
                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
                .onTapGesture {
                    self.index = 0
                }
                .cornerRadius(35)
                .padding(.horizontal, 25)
            
            Button(action: {
                //
            }) {
                Text("LOGIN")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color(#colorLiteral(red: 0.2362799048, green: 0.516187489, blue: 0.3912792802, alpha: 1)))
                    .clipShape(Capsule())
                    .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
            }
            .offset(y: 35)
            .opacity(self.index == 0 ? 1 : 0)
        }
        .offset(x: -10, y: 180)
    }
}

struct SignUp: View {
    @State var email = ""
    @State var pass = ""
    @State var repass = ""
    @Binding var index: Int
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                HStack {
                    Spacer(minLength: 0)
                    
                    VStack(spacing: 10) {
                        Text("Sign Up")
                            .foregroundColor(self.index == 1 ? .white : Color(#colorLiteral(red: 0.3789061904, green: 0.3789061904, blue: 0.3789061904, alpha: 1)))
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Capsule()
                            .fill(self.index == 1 ? Color(#colorLiteral(red: 0.604090035, green: 0.8739195466, blue: 0.762126863, alpha: 1)) : Color.clear)
                            .frame(width: 100, height: 10)
                    }
                }
                .padding(.top, 30)
                
                VStack {
                    HStack(spacing: 15) {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color(#colorLiteral(red: 0.604090035, green: 0.8739195466, blue: 0.762126863, alpha: 1)))
                        TextField("Email Adress", text: self.$email)
                    }
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 40)
                
                VStack {
                    
                    HStack(spacing: 15) {
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color(#colorLiteral(red: 0.604090035, green: 0.8739195466, blue: 0.762126863, alpha: 1)))
                        SecureField("Password", text: self.$pass)
                    }
                    Divider()
                        .background(Color.white.opacity(0.5))
                }.padding(.horizontal)
                    .padding(.top, 30)
                
                VStack {
                    HStack(spacing: 15) {
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color(#colorLiteral(red: 0.604090035, green: 0.8739195466, blue: 0.762126863, alpha: 1)))
                        SecureField("Password", text: self.$repass)
                    }
                    Divider().background(Color.white.opacity(0.5))
                }.padding(.horizontal)
                    .padding(.top, 30)
            }
            .padding()
            .padding(.bottom, 65)
            .background(Color(#colorLiteral(red: 0.3174917996, green: 0.602907598, blue: 0.4823802114, alpha: 1)))
            .clipShape(CShape1())
            .contentShape(CShape1())
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
            .onTapGesture {
                self.index = 1
            }
            .cornerRadius(35)
            .padding(.horizontal, 20)
            .offset(x:5 ,y: 180)
            
            Button(action: {
                //
            }) {
                Text("SIGN UP")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color(#colorLiteral(red: 0.2362799048, green: 0.516187489, blue: 0.3912792802, alpha: 1)))
                    .clipShape(Capsule())
                    .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: -5)
            }
            .offset(y: 200)
            .opacity(self.index == 1 ? 1 : 0)
        }
    }
}
