Class {
	#name : #BasysConnectionPoolTestCase,
	#superclass : #TestCase,
	#instVars : [
		'remotePeer',
		'connectionPool'
	],
	#category : #'Basys-Tests'
}

{ #category : #testing }
BasysConnectionPoolTestCase class >> isAbstract [ 	
	^self = BasysConnectionPoolTestCase 
]

{ #category : #running }
BasysConnectionPoolTestCase >> createConnectionPool [
	self subclassResponsibility 
]

{ #category : #running }
BasysConnectionPoolTestCase >> setUp [
	super setUp.
	
	remotePeer := Mock new.
	remotePeer stub maxConnections willReturn: 100.
	Mock stub isValid willReturn: true. "To simulate valid connections by default"
	Mock stub isBusy willReturn: false. "To simulate free connections by default"	
	Mock stub close will: [ "To simulate connection close logic which removes it from peer"
		connectionPool removeClosedConnection: thisContext sender sender arguments first receiver ].
	connectionPool := self createConnectionPool
]
