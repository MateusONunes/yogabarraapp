/*Referencia: Semana OmniStack 11.0 - 24:05 - 	Routes.js - https://docs.expo.io
    https://docs.expo.io/versions/latest/guides/routing-and-navigation/
    https://github.com/react-navigation/react-navigation
    https://reactnavigation.org/docs/getting-started
        npm install @react-navigation/native
        expo install react-native-gesture-handler react-native-reanimated react-native-screens react-native-safe-area-context @react-native-community/masked-view

*/
import {createAppContainer, createSwitchNavigator} from 'react-navigation'; //npm install react-navigation/native --save
                                                                            //npm install react-native-gesture-handler react-native-reanimated --save
                                                                            //** este ainda não */  react-native-screens react-native-safe-area-context @react-native-community/masked-view

//const AppStack = createStackNavigator();

import Login from './pages/Login';
import Initial from './pages/initial';
import Student from './pages/student';
//import Classprice from './pages/classprice';
import Test from './pages/Test';

const Routes = createAppContainer(
  createSwitchNavigator(
    {Login, Initial, Student, Test},
    {
      initialRouteName: 'Login',
      backBehavior: 'history',
    },
  ),
);

export default Routes;