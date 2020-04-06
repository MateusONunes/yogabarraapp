/*Referencia: Semana OmniStack 11.0 - 24:05 - 	Routes.js - https://docs.expo.io
    https://docs.expo.io/versions/latest/guides/routing-and-navigation/
    https://github.com/react-navigation/react-navigation
    https://reactnavigation.org/docs/getting-started
        npm install @react-navigation/native
        expo install react-native-gesture-handler react-native-reanimated react-native-screens react-native-safe-area-context @react-native-community/masked-view

*/
import React from 'react'
import { NavigationContainer } from '@react-navigation/native'
import { createStackNavigator } from '@react-navigation/stack'

const AppStack = createStackNavigator()

import Login from './pages/Login'
import Initial from './pages/initial'
import Classprice from './pages/classprice'
import Student from './pages/student'

export default function Routes() {
    return (
            <NavigationContainer>
                <AppStack.Navigator screenOptions={{ headerShown: false }}>
                    <AppStack.Screen name="Login" component={Login} />
                    <AppStack.Screen name="Student" component={Student} />
                    <AppStack.Screen name="Initial" component={Initial} />
                    <AppStack.Screen name="Classprice" component={Classprice} />
                </AppStack.Navigator>
            </NavigationContainer>

    )
}