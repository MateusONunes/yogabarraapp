import { StyleSheet } from 'react-native'
import Constants from 'expo-constants'

export default StyleSheet.create({
    inputText:{
        borderStyle: "solid",
        fontSize: 20,
        borderWidth: 1,
        borderRadius: 4,
        borderColor:'#4a2dad',
    },
    inputLabel: {
        marginTop: 8
        


    },
    forms:{
        paddingTop: 16,
        height: 250,
        backgroundColor: '#c0b0f7'
    },
    CidyContainer:{
        flex:1,
        flexDirection: 'row',
        alignContent: 'space-between',
        marginTop: 8,
        height:80
    }

})