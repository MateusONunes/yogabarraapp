import { StyleSheet } from 'react-native'
import Constants from 'expo-constants'

export default StyleSheet.create({
    container:{
        flex:1,
        paddingHorizontal: 4,
        paddingTop: Constants.statusBarHeight
    },

    header: {
        fontSize: 42,
        paddingTop: 32,
        textAlign: "center",
        color: '#7532a8',
        fontWeight: "bold"
    },

    enterbox: {
        flexDirection:'row',
        alignItems: 'center',
        marginTop: 8,
        marginLeft: 0,
        marginRight: 0,
        padding: 4,
        backgroundColor: '#7532a8',
        borderRadius: 16
    },

    defaulttext: {
        color: '#ffffff',
        fontSize: 32,
        marginRight: 16
    }
})